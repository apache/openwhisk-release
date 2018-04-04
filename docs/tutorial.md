<!--
#
# Licensed to the Apache Software Foundation (ASF) under one or more contributor
# license agreements.  See the NOTICE file distributed with this work for additional
# information regarding copyright ownership.  The ASF licenses this file to you
# under the Apache License, Version 2.0 (the # "License"); you may not use this
# file except in compliance with the License.  You may obtain a copy of the License
# at:
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations under the License.
#
-->

# Release Manager Tutorial

## Key requirements for producing releases

As a Release Manager, please know that most of these requirements are addressed via the release process automation provided in this project; however, some steps are manual. Regardless of automation, it is good to understand all the key considerations and requirements that a release manager is ultimately responsible for.

### Licensing requirements

All the source code has to be compliant with Apache Licensing Policy, by adding the LICENSE file, NOTICE file to each repository and the release package, and adding Licensing headers to each source code file. Please visit [License_Compliance](docs/license_compliance.md) for detailed information.

### Artifact requirements Artifacts for project repository source code and any compiled binaries are packaged separately with each artifact being signed cryptographically.

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

Apache requires a minimum of three positive votes and more positive than negative votes MUST be cast, in order to release.

-The Release manager for Apache OpenWhisk sends a release note to the OpenWhisk mailing for votes, and opens the mail for 72 hours.
- **TBD** We can create JIRA issue for this release and close it when the requirement is met and ready for release. **TODO** further document discrete steps/requirements community agrees upon.

### Create Release notes

An example of the release note can be found at the following link: [example of release note](https://github.com/apache/cordova-coho/blob/master/docs/coho-release-process.md).

# Release Process

This project offers the Apache OpenWhisk Release Manager two modes to release OpenWhisk projects:
- Manual mode and
- Automated mode.

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
