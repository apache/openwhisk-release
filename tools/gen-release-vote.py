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
import subprocess
from email.mime.text import MIMEText

class objectify(object):
    def __init__(self, d):
        self.__dict__ = d

def parseArgsAndConfig():
    parser = argparse.ArgumentParser(description='Generates Release Candidate Vote Email')
    parser.add_argument('-v', '--verbose', help='verbose output', action='store_true')
    parser.add_argument('-n', '--dryrun', help='verbose output', action='store_true')
    parser.add_argument('-mc', '--mail-conf', help='YAML configuration file for mailer', metavar='YAML', type=argparse.FileType('r'), required=False)
    parser.add_argument('-s', '--subject', help='Component name for subject line', metavar='NAME')
    parser.add_argument('-i', '--signature', help='Signature line to conclude email', metavar='SIGNATURE')
    parser.add_argument('rc_conf', help='JSON configuration file for release candidate', metavar='release-config-file', type=argparse.FileType('r'))

    if argcomplete:
        argcomplete.autocomplete(parser)

    args = parser.parse_args()

    args.rcConfig = json.load(args.rc_conf)
    if not args.dryrun and 'mail_conf' in args and args.mail_conf is not None:
      args.mailConfig = yaml.load(args.mail_conf, Loader=yaml.FullLoader)
      if 'mail' not in args.mailConfig:
        print('Error: bad configuration, need "mail" properties.')
        return
      else:
        args.mailConfig = args.mailConfig['mail']
    else:
      args.mailConfig = None
    return args

def componentList(config, version):
    for r in config['RepoList']:
        key = r.replace('-', '_')
        hash = config[key]['hash']
        name = config[key]['name'] if 'name' in config[key] else '???'
        repo = config[key]['repository']
        yield objectify({
                'id': r,
                'hash': hash,
                'name': name,
                'url': repo[0:-4],
                'artifacts': artifactLinks(r, version.v, version.rc)
        })

def artifactLinks(name, version, rc):
    root = 'https://dist.apache.org/repos/dist/dev/openwhisk/%s' % (rc)
    tgz  = '%s-%s-sources.tar.gz' % (name, version)
    asc  = '%s.asc' % tgz
    sha  = '%s.sha512' % tgz
    return objectify({
       'tgz': '%s/%s' % (root, tgz),
       'asc': '%s/%s' % (root, asc),
       'sha': '%s/%s' % (root, sha)
    })

def currentGitHead():
    res = subprocess.check_output(['git', 'show-ref', '--hash', '--abbrev', '--', 'refs/remotes/upstream/master'])
    res = res.decode('ascii')
    return res.strip()

def gitHashes(components):
    s = map(lambda r: "* %s: %s\n  %s/commit/%s\n  %s\n  %s\n  %s\n" % (r.name, r.hash, r.url, r.hash, r.artifacts.tgz, r.artifacts.asc, r.artifacts.sha), components)
    return '\n'.join(list(s))

def rcverify(components, version):
    s = map(lambda r: "./rcverify.sh %s %s %s" % (r.id, version.v, version.rc), components)
    return '\n'.join(list(s))

def releaseVersion(config):
    return objectify({
            'v': config['versioning']['version'],
            'rc': config['versioning']['pre_release_version']
    })

def sendVoteEmail(mailConfig, rcConfig, dryrun, subjectLineId, signature):
    version = releaseVersion(rcConfig)
    components = list(componentList(rcConfig, version))
    componentsString = ', '.join(map(lambda c: c.name, components))
    componentCount = len(components)

    subject = '[VOTE] Release Apache %s (v%s, %s)' % (subjectLineId if subjectLineId else componentsString, version.v, version.rc)
    content = """Hi,

This is a call to vote on releasing version {version} release candidate {rc} of the following {N} with artifacts built from the Git repositories and commit IDs listed below.

{githashes}
This release is comprised of source code distribution only.

You can use this UNIX script to download the release and verify the checklist below:
https://gitbox.apache.org/repos/asf?p=openwhisk-release.git;a=blob_plain;f=tools/rcverify.sh;hb={HEAD}

Usage:
curl -s "https://gitbox.apache.org/repos/asf?p=openwhisk-release.git;a=blob_plain;f=tools/rcverify.sh;hb={HEAD}" -o rcverify.sh
chmod +x rcverify.sh
{rcverifies}

Please vote to approve this release:

  [ ] +1 Approve the release
  [ ]  0 Don't care
  [ ] -1 Don't release, because ...

Release verification checklist for reference:
  [ ] Download links are valid.
  [ ] Checksums and PGP signatures are valid.
  [ ] Source code artifacts have correct names matching the current release.
  [ ] LICENSE and NOTICE files are correct for each OpenWhisk repository.
  [ ] All files have license headers as specified by OpenWhisk project policy [1].
  [ ] No compiled archives bundled in source archive.

This majority vote is open for at least 72 hours.
{signature}

[1] https://github.com/apache/openwhisk-release/blob/master/docs/license_compliance.md""".format(
        version = version.v,
        rc = version.rc,
        N = ("%s project modules" % componentCount) if componentCount > 1 else "project module",
        HEAD = currentGitHead(),
        githashes = gitHashes(components),
        rcverifies = rcverify(components, version),
        signature = ("\n%s" % signature) if signature else "")

    if (dryrun or mailConfig is None):
      print(subject)
      print(content)
      return

    print('Sending email: %s -> %s' % (mailConfig['from'], mailConfig['to']))

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
  sendVoteEmail(args.mailConfig, args.rcConfig, args.dryrun, args.subject, args.signature)

if __name__ == "__main__":
  args = parseArgsAndConfig()
  if args:
    main(args)
  else:
    sys.exit(-1)
