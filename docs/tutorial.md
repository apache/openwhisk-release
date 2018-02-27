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

This project offers the release manager of OpenWhisk two modes to release OpenWhisk projects: manual mode and automated mode.
Manual mode makes sure that the release manager can download the source code of this repository, and go through the release
process by running scripts sequentially on a local machine, to push the artifacts into the staging directory and eventually
move them into the Apache release directory. Automated mode provides the release manager another option to walk through the
Apache release process by kicking off the Travis job to run the scripts. A release manager can choose either way to publish
the artifacts in the staging directory and the Apache release directory.

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
  10. [Publish the release artifacts to Apache release directory](publish_apache_directory.md)
  11. Announce the release

## Automated mode of Release Process

The release manager can take full advantage of Travis CI to implement the release process. The only manual step is to
configure the release information, by editing the configuration file _config.json_. Please refer to [edit configuration file](pick_up_source_code.md#edit-the-configuration-file)
for the information able to be configured.

* **PR-based Travis build**: the Travis build triggered by a pull request. Each time the file config.json is ready, release
manager can submit a pull request to the master branch of OpenWhisk release repository. Based on the result of the Travis build,
we know whether the configurations in config.json can be used as a candidate to release. This type of Travis build will
download the source code, generate the artifacts, sign the artifacts, install the OpenWhisk services and run the test cases.

* **Push-based Travis build**: the Travis build triggered by a push into master branch. When a PR with new configurations
is accepted, the release manager can merge it to kick off this type of Travis build. On top of the tasks done by PR-based
Travis build, it will upload the artifacts into the staging directory.

* **Tag-based Travis build**: the Travis build triggered by git tag. After the vote succeeds in the community, we decide to
move the artifacts from the staging directory to the Apache release directory. This type of Travis build is responsible
for this task.

In summary, the release process of OpenWhisk is the process of developing the configuration file _config.json_ for a
certain release.
