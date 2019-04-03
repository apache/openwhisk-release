#!/usr/bin/env python
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

import argparse
try:
    import argcomplete
except ImportError:
    argcomplete = False
import os
import yaml
import json
import sys
import smtplib
from email.mime.text import MIMEText

class objectify(object):
    def __init__(self, d):
        self.__dict__ = d

def parseArgsAndConfig():
    parser = argparse.ArgumentParser(description='Generates Release Candidate Vote Email')
    parser.add_argument('-v', '--verbose', help='verbose output', action='store_true')
    parser.add_argument('-n', '--dryrun', help='verbose output', action='store_true')
    parser.add_argument('-mc', '--mail-conf', help='YAML configuration file for mailer', metavar='YAML', type=argparse.FileType('r'), required=False)
    parser.add_argument('-rc', '--rc-conf', help='JSON configuration file for release candidate', metavar='JSON', type=argparse.FileType('r'), required=True)
    parser.add_argument('-s', '--subject', help='Component name for subject line', metavar='NAME')

    if argcomplete:
        argcomplete.autocomplete(parser)

    args = parser.parse_args()

    args.rcConfig = json.load(args.rc_conf)
    if not args.dryrun:
      if 'mail_config' not in args:
        parser.error("--mail-config required except for a dryrun.")

      args.mailConfig = yaml.load(args.mail_conf)
      if 'mail' not in args.mailConfig:
        print('Error: bad configuration, need "mail" properties.')
        return
      else:
        args.mailConfig = args.mailConfig['mail']
    else:
        args.mailConfig = None
    return args

def componentList(config):
    for r in config['RepoList']:
        key = r.replace('-', '_')
        hash = config[key]['hash']
        name = config[key]['name'] if 'name' in config[key] else '???'
        yield objectify({
                'id': r,
                'hash': hash,
                'name': name
        })

def gitHashes(components):
    s = map(lambda r: "* %s: %s" % (r.name, r.hash), components)
    return '\n'.join(list(s))

def rcverify(components, version):
    s = map(lambda r: "rcverify.sh %s '%s' %s" % (r.id, r.name, version), components)
    return '\n'.join(list(s))

def releaseVersion(config):
    return objectify({
            'v': config['versioning']['version'],
            'rc': config['versioning']['pre_release_version']
    })

def sendVoteEmail(mailConfig, rcConfig, dryrun, subjectLineId):
    components = list(componentList(rcConfig))
    componentsString = ', '.join(map(lambda c: c.name, components))
    version = releaseVersion(rcConfig)
    subject = '[VOTE] Release Apache OpenWhisk %s (v%s, %s)' % (subjectLineId if subjectLineId else componentsString, version.v, version.rc)
    content = """Hi,

This is a call to vote on releasing version {version} release
candidate {rc} of the following {N} project modules with artifacts
built from the Git repositories and commit IDs listed below.

{githashes}

This release comprises of source code distribution only.

You can use this UNIX script to download the release and verify the checklist below:
https://gitbox.apache.org/repos/asf?p=incubator-openwhisk-release.git;a=blob_plain;f=tools/rcverify.sh;hb=HEAD

Usage:
curl -s "https://gitbox.apache.org/repos/asf?p=incubator-openwhisk-release.git;a=blob_plain;f=tools/rcverify.sh;hb=HEAD" -o rcverify.sh
chmod +x rcverify.sh
{rcverifies}

Please vote to approve this release:

  [ ] +1 Approve the release
  [ ]  0 Don't care
  [ ] -1 Don't release, because ...

Release verification checklist for reference:
  [ ] Download links are valid.
  [ ] Checksums and PGP signatures are valid.
  [ ] DISCLAIMER is included.
  [ ] Source code artifacts have correct names matching the current release.
  [ ] LICENSE and NOTICE files are correct for each OpenWhisk repository.
  [ ] All files have license headers if necessary.
  [ ] No compiled archives bundled in source archive.

This majority vote is open for at least 72 hours.
""".format(version = version.v,
           rc = version.rc,
           N = len(components),
           githashes = gitHashes(components),
           rcverifies = rcverify(components, version.v))

    if (dryrun):
      print(subject)
      print(content)
      return

    print('Sending email: %s -> %s' % (frm, to))

    msg = MIMEText(content, _charset='utf-8')
    msg['From'] = mailConfig['from']
    msg['To'] = mailConfig['to']
    msg['Subject'] = subject
    server = smtplib.SMTP(mailConfig['smtp'])
    if mailConfig['useTLS']:
        server.starttls()
    if 'username' in mailConfig:
        server.login(mailConfig['username'], mailConfig['password'])

    server.sendmail(mailConfig['from'], mailConfig['to'], msg.as_string())
    server.quit()

def main(args):
  sendVoteEmail(args.mailConfig, args.rcConfig, args.dryrun, args.subject)

if __name__ == "__main__":
  args = parseArgsAndConfig()
  if args:
    main(args)
  else:
    sys.exit(-1)
