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

This project offers the Apache OpenWhisk Release Manager two modes to release OpenWhisk projects:
- **Manual mode** and
- **Automated mode**

_Manual mode_ makes sure that the release manager can download the source code of this repository, and go through the release process by running scripts sequentially on a local machine, to push the artifacts into the staging directory and eventually move them into the Apache release directory.

_Automated mode_ provides the release manager another option to walk through the Apache release process by kicking off the Travis job to run the scripts. A release manager can choose either way to publish the artifacts in the staging directory and the Apache release directory.

## Manual mode of Release Process
  1. [Preparing for a release](prepare_release.md) - how to prepare OpenWhisk projects for a release
  2. [Prerequisites](prerequisites.md) - steps that release manager needs to do before a release
  3. [Picking up the source code](pick_up_source_code.md) - determine the branch and hash value for each OpenWhisk project to release
  4. [Making the release artifacts](package_artifacts.md)
  5. [Signing the release artifacts](sign_artifacts.md)
  6. [Uploading public PGP key](upload_public_key.md)
  7. [Publish the release artifacts to the staging directory](push_stage_url.md)
  8. Vote on the dev@openwhisk.apache.org list
  9. If the vote fails - configure the file config.json and resume from step 3
  10. If the vote passes - send Vote on the general@incubator.apache.org list (cc dev list)
  11. if the vote fails - configure the file config.json and resume from step 3
  12. if the vote passes - close the vote with final email to incubator list (cc dev list)
  13. [Publish the release artifacts to Apache release directory](publish_apache_directory.md)
  14. [Generate the release notes](generate_release_notes.md)
  15. Announce the release

## Automated mode of Release Process

The release manager can take full advantage of Travis CI to implement the release process. The only manual step is to configure the release information, by editing the configuration file _config.json_. Please refer to [edit configuration file](pick_up_source_code.md#edit-the-configuration-file) for the information able to be configured.

* **PR-based Travis build**: the Travis build triggered by a pull request. Each time the file config.json is ready, release manager can submit a pull request to the master branch of OpenWhisk release repository. Based on the result of the Travis build, we know whether the configurations in config.json can be used as a candidate to release. This type of Travis build will download the source code, generate the artifacts, sign the artifacts, install the OpenWhisk services and run the test cases.

* **Push-based Travis build**: the Travis build triggered by a push into master branch. When a PR with new configurations is accepted, the release manager can merge it to kick off this type of Travis build. On top of the tasks done by PR-based Travis build, it will upload the artifacts into the staging directory.

* **Tag-based Travis build**: the Travis build triggered by git tag. After the vote succeeds in the community, we decide to move the artifacts from the staging directory to the Apache release directory. This type of Travis build is responsible for this task.

In summary, the release process of OpenWhisk is the process of developing the configuration file _config.json_ for a certain release.

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
- [https://dist.apache.org/repos/dist/dev/incubator/openwhisk/](https://dist.apache.org/repos/dist/dev/incubator/openwhisk/)

and the approved release path:
- [https://dist.apache.org/repos/dist/release/incubator/openwhisk/](https://dist.apache.org/repos/dist/release/incubator/openwhisk/).

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
https://gitbox.apache.org/repos/asf?p=incubator-openwhisk-release.git;a=blob_plain;f=tools/rcverify.sh;hb=HEAD

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

- **TBD** We can create JIRA issue for this release and close it when the requirement is met and ready for release. **TODO** further document discrete steps/requirements community agrees upon.

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
rcverify.sh openwhisk-client-js 'OpenWhisk JavaScript Client Library' 3.19.0-incubating
```

Example output from `rcverify.sh`:
```
working in the following directory:
/tmp/tmp.6t9xcMV8
fetching openwhisk-client-js-3.19.0-incubating-sources.tar.gz
fetching openwhisk-client-js-3.19.0-incubating-sources.tar.gz.asc
fetching openwhisk-client-js-3.19.0-incubating-sources.tar.gz.sha512
fetching release keys
import keys
gpg: key ABCXYZ: "Some Name <some@email>" ...
gpg: key FOOBAR: "Another Name <another@email>" ...
gpg: Total number processed: 2
gpg:              unchanged: 2
unpacking tar ball
cloning scancode
Cloning into 'incubator-openwhisk-utilities'...
remote: Enumerating objects: 52, done.
remote: Counting objects: 100% (52/52), done.
remote: Compressing objects: 100% (35/35), done.
remote: Total 52 (delta 23), reused 34 (delta 15), pack-reused 0
Unpacking objects: 100% (52/52), done.
computing sha512 and validating... passed
verifying asc... passed (signed-by: Some Name <some@email>)
verifying disclaimer... passed
verifing notice... passed
verifying license... failed (diff '/tmp/tmp.6t9xcMV8/incubator-openwhisk-client-js-3.19.0-incubating/LICENSE.txt' '/tmp/tmp.6t9xcMV8/LICENSE-2.0')
verifying sources have proper headers... passed
scanning for binaries... passed

run the following command to remove the scratch space:
  rm -rf '/tmp/tmp.6t9xcMV8'


### Create Release notes

An example of the release note can be found at the following link: [example of release note](https://github.com/apache/cordova-coho/blob/master/docs/coho-release-process.md).
