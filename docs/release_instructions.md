<!--
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
-->

# Instructions for Release Managers

# Release process

This project contains scripts to automate most aspects of making a release of one or more Apache OpenWhisk projects.

It is intended to be used by a project Release Manager who will clone this repository to their
local dev machine and then go through the release process by running scripts sequentially on a local machine, to push the artifacts into the staging directory and eventually move them into the Apache release directory.

## Manual mode of Release Process

If you work as a release manager on an official release for an OpenWhisk project, manual mode is recommended for you to go
through and understand all the necessary steps of Apache release process tailored for OpenWhisk.

  1. [Preparing for a release](prepare_release.md) - how to prepare OpenWhisk projects for a release
  2. [Prerequisites](prerequisites.md) - steps that release manager needs to do before a release
  3. [Picking up the source code](pick_up_source_code.md) - determine the branch and hash value for each OpenWhisk project to release
  4. [Making the release artifacts](package_artifacts.md)
  5. [Signing the release artifacts](sign_artifacts.md)
  6. [Uploading public PGP key](upload_public_key.md)
  7. [Publish the release artifacts to the staging directory](push_stage_url.md)
  8. Vote on the dev@openwhisk.apache.org list
  9. If the vote fails - configure the file config.json and resume from step 3.  If the vote passes, continue with step 10.
  10. [Publish the release artifacts to Apache release directory](publish_apache_directory.md)
  11. [Tag the commit IDs in the Github repository for the project](tag_release.md)
  12. [Generate the release notes](generate_release_notes.md)
  13. Announce the release
  14. Cleanup the artifacts from the release process:
      a. Remove the rc files from staging.
      b. If there is a previous released version, remove it from Apache release directory
         (it will automatically still be available via the Apache archive server).

## Key requirements for producing releases

As a Release Manager, please know that most of these requirements are addressed via the release process automation provided in this project; however, some steps are manual. Regardless of automation, it is good to understand all the key considerations and requirements that a release manager is ultimately responsible for.

### Licensing requirements

All released source code has to be compliant with Apache Licensing Policy, by adding the LICENSE file, NOTICE file to each repository and the release package, and adding Licensing headers to each source code file.
- Please see [License Compliance](license_compliance.md) for detailed information on Apache OpenWhisk project policies, rules and guidelines.

### Artifact requirements

Artifacts for project repository source code and any compiled binaries are packaged separately with each artifact being signed cryptographically.

Source code needs to provide the installation script for users to deploy a full OpenWhisk environment. We target to implement this step in Travis build.

### Release distribution requirements

These steps have been **automated** for the Release Manager.

All release artifacts must be uploaded to project’s designated subdirectory in the Apache distribution channel (i.e., [https://dist.apache.org/repos/dist/](https://dist.apache.org/repos/dist/)).

Specifically, the Apache OpenWhisk project has paths to publish both candidate (staged) releases:
- [https://dist.apache.org/repos/dist/dev/openwhisk/](https://dist.apache.org/repos/dist/dev/openwhisk/)

and the approved release path:
- [https://dist.apache.org/repos/dist/release/openwhisk/](https://dist.apache.org/repos/dist/release/openwhisk/).

### Release Approval

These steps are **manual** and must be performed by the Release Manager.
 - Starting the Vote: The Release manager for Apache OpenWhisk sends a release note to the OpenWhisk mailing for votes, and opens the mail for 72 hours. Apache requires a minimum of three positive votes and more positive than negative votes MUST be cast, in order to release.

 - Wait for the Results

#### Starting the Vote

Propose a vote on the dev list. Here is an example:
```
To: "OpenWhisk Developers List" <dev@openwhisk.apache.org>
Subject: [VOTE] Release Apache OpenWhisk {component} version {version}

Hi,

This is a call to vote on releasing version {version} release
candidate {rc} of the following {N} project modules with artifacts
built from the Git repositories and commit IDs listed below.

* {YOUR REPOSITORY ID} : {GIT HASH}
* {... list others if more than one}

This release comprises of source code distribution only.

You can use this UNIX script to download the release and verify the signatures:
https://gitbox.apache.org/repos/asf?p=openwhisk-release.git;a=blob_plain;f=tools/rcverify.sh;hb=HEAD

Usage:
sh rcverify.sh {repository} {component} {version}

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
```

#### Wait for the Results

From [Votes on Package Releases](http://www.apache.org/foundation/voting.html):
```
Votes on whether a package is ready to be released follow a format
similar to majority approval -- except that the decision is officially
determined solely by whether at least three +1 votes were
registered. Releases may not be vetoed. Generally the community will
table the vote to release if anyone identifies serious problems, but
in most cases the ultimate decision, once three or more positive votes
have been garnered, lies with the individual serving as release
manager. The specifics of the process may vary from project to
project, but the 'minimum of three +1 votes' rule is universal.
```

The list of binding voters is available on the Project Team page.

If the vote is successful, post the result to the dev list - for example:
```
To: "OpenWhisk Developers List" <dev@openwhisk.apache.org>
Subject: [RESULT] [VOTE] Release Apache OpenWhisk {ABC} version {X.Y.Z}

Hi,

The vote has passed with the following result:

+1 (binding): <<list of names>>
+1 (non binding): <<list of names>>
```

Be sure to include all votes in the list and indicate which votes were binding. Consider -1 votes very carefully. While there is technically no veto on release votes, there may be reasons for people to vote -1. So sometimes it may be better to cancel a release when someone, especially a member of the PMC, votes -1.

If the vote is unsuccessful, you need to fix the issues and restart the process. Note that any changes to the artifacts under vote require a restart of the process, no matter how trivial. When restarting a vote version numbers must not be reused, since binaries might have already been copied around.

#### Release verification tool

The script [rcverify.sh](../tools/rcverify.sh) is available to automate the process of verifying a release.
The script will download the release candidate, verify signatures, discalaimer, notice, and license. The tool assumes that are no executable files in the release and will flag any executable that it finds. If the tool discovers an issue during verification, it will try to emit useful information for you to further inspect the findings. The release is left on your disk for you to further inspect and you must delete the scratch space when finished.

Example of how to use `rcverify.sh`:
```
rcverify.sh openwhisk-client-js 'OpenWhisk Client Js' 3.20.0 rc2
```

Example output from `rcverify.sh`:
```
working in the following directory:
/var/folders/8c/zvj0nsxx2rgc_km8nvf8k0c00000gn/T/tmp.S8okDNye
fetching tarball and signatures from https://dist.apache.org/repos/dist/dev/openwhisk/apache-openwhisk-3.20.0-rc2
fetching openwhisk-client-js-3.20.0-sources.tar.gz
fetching openwhisk-client-js-3.20.0-sources.tar.gz.asc
fetching openwhisk-client-js-3.20.0-sources.tar.gz.sha512
fetching release keys
importing keys
gpg: key 72AF0CC22C4CF320: "Vincent Hou (Release manager of OpenWhisk) <ho...@apache.org>" not changed
gpg: key 22907064147F886E: "Dave Grove <dg...@apache.org>" not changed
gpg: key 44667BC927C86D51: "Rodric Rabbah <ra...@apache.org>" not changed
gpg: key B1457C3D7101CC78: "James Thomas <ja...@apache.org>" not changed
gpg: Total number processed: 4
gpg:              unchanged: 4
unpacking tar ball
cloning scancode
Cloning into 'incubator-openwhisk-utilities'...
remote: Enumerating objects: 55, done.
remote: Counting objects: 100% (55/55), done.
remote: Compressing objects: 100% (41/41), done.
remote: Total 55 (delta 21), reused 29 (delta 11), pack-reused 0
Unpacking objects: 100% (55/55), done.
computing sha512 for openwhisk-client-js-3.20.0-sources.tar.gz
SHA512: openwhisk-client-js-3.20.0-sources.tar.gz:
5FEF999E 532BD0C1 6C8BC0A1 F5232C93 964A30CF F14B2D82 1C8A2E1D 1106339C E2457918
 C9873B3B 26FB4711 4FBA6F1C 8C8A62A8 3D50592C F9617EA5 54827EBA
validating sha512... passed
verifying asc... passed (signed-by: James Thomas <ja...@apache.org>)
verifing notice... passed
verifying absence of DISCLAIMER.txt passed
verifying license... passed
verifying sources have proper headers... passed
scanning for executable files... passed
scanning for non-text files... passed
scanning for archives... passed
scanning for packages... passed
```

### Create Release notes

An example of the release note can be found at the following link: [example of release note](https://github.com/apache/cordova-coho/blob/master/docs/coho-release-process.md).
