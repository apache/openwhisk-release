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

# Identified work items

Before we pushing any release packages into the staging repository or the Apache directory. The source code of all OpenWhisk
projects are hosted under [apache folder at Github](https://github.com/apache). Release managers are responsible for picking
up valid hash values or tags for each OpenWhisk project to be released. As we described on the [General Specification](general_specs.md)
page, a JSON-format configuration file is used to save the project names with the hash values or tags. Then, source code
can be downloaded based on the configuration, and verified the compliance either by some existing tools or programs. If
the source code meets the requirements, we can proceed to deploy the OpenWhisk services and other client tools, and run
the test cases to check whether the services are up and running, whether the client tools are ready to use, etc.

This release of the source code packages need to have the following features implemented.

## 1. Download the source code ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/16))

All the source code OpenWhisk project is located at the Github website. If a configuration file is in place, we should
be able to download the source code, based on the hash values or tags, defined for each specified repository. This
feature can be implemented in a bash script, which is able to run both on a local machine or in Travis build. 

The script can be named "download_source_code.sh". When this repository is cloned, go to the home directory of this repository,
and run ./download_source_code.sh in a terminal. The source code of OpenWhisk projects should be downloaded to either
the specified place or the default place. When a Travis build is kicked off, this script should be called in order to
download the source code. It is better to support both Ubuntu and Mac systems.

**Work bulletins**:
- Download the source code into a local workspace, based on predefined project hashes or tags
- By default, clone the source code with all the git history into a default directory

## 2. Verify the compliance of the source code ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/17))

Each source code file needs to have Apache licensing header at the top. We need to implement the verification in the
script able to run both locally and in Travis build.

**Work bulletins**:
- Check if all the source code files have valid licensing headers
    - Investigate what tools can be used to valid the headers, like Apache RAT, etc
    - Implement in the script to check the headers
- Other verifications to be determined

## 3. Deploy OpenWhisk based on the source code ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/18))

Build the source code and deploy the OpenWhisk environment. We need to implement the following bulletins in the script.

**Work bulletins**:
- Build the images for OpenWhisk services
- Build the images for all the runtimes
- Build the CLI, wskdeploy, and any other client tool
- Build the image for api gateway
- Deploy OpenWhisk services
- Install catalog


## 4. Test each OpenWhisk component ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/19))

This step is optional for the release process, but the release manager needs to make sure the code we deliver is in
good shape in terms of functionality.

**Work bulletins**:
- Test OpenWhisk services by running the test cases under OpenWhisk repository.
- Test OpenWhisk catalog by running the test cases under OpenWhisk catalog repository.
- Test the CLI, wskdeploy, and any other client tool by running the test cases under each repository.
- Test api gateway by running the test cases under OpenWhisk api gateway
- ...

## 5. Add NOTICE, LICENSE, and CHANGELOG to each OpenWhisk project ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/13))

We need to prepare these files when release managers are developing the release repository. As we investigated, Apache
Tentacles can create the LICENSE and NOTICE report. The current question is: can we run this tools locally, to generate
the NOTICE and LICENSE, before we upload artifacts to any repository, like the staging repository?(TBD)

**Work bulletins**:
- Investigate how to generate NOTICE, LICENSE, and CHANGELOG, unless we have to manually edit them.
    - For files with static content, we can add them into the existing project.
    - For files with dynamic content for different releases, we can either manually edit them or use tools to generate them.

## 6. Package the artifacts ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/20))

Each OpenWhisk project needs to have one compiled package, and one source code package. This is probably where the Maven
release plugin can play out. As we have already downloaded the source code of each OpenWhisk repository, Maven command
can be used to generate all the artifacts. 

One challenge we can think of is that OpenWhisk consists of projects based on different programming languages individually,
we need to figure out how to package the artifacts differently for different languages, by using the similar or
consistent build environment. OpenWhisk core is based on Scala, CLI is based on Go, wskdeploy is based on Go, api gateway
is based on lua, runtime project may be based on its native runtime language, etc. 

Another important item in this step is to sign the artifacts cryptographically for the release. We need to figure out
how to do it, either in Travis CI, Jenkins pipeline, or any other building tools.

**Work bulletins**:
- Investigate how to package the artifacts with existing tools, like Gradle, Maven, any other building plugins, etc.
- Investigate how the tools works on the source code differently, according to different languages
- Implement the script to package the artifacts
- Sign the artifacts cryptographically for the staging and release

## 7. Upload the artifacts into staging repository for release vote ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/21))

Upload the artifacts including source code, compiled packages, etc into the staging repository for vote.
This is the [staging directory of Apache projects](https://dist.apache.org/repos/dist/dev/incubator/openwhisk/) for OpenWhisk.

**Work bulletins**:
- Investigate how to upload the artifacts to a staging repository with existing tools, like Gradle, Maven, any other
building plugins, etc
- Implement the script to upload the artifacts to the staging repository
- Validate the artifacts in the staging repository

## 8. Release the artifacts ([open issue](https://github.com/apache/incubator-openwhisk-release/issues/22))

When we reach an agreement on the candidate located in the staging repository, the artifacts need to be move to the Apache\
directory for release. This is the [release directory of Apache](https://dist.apache.org/repos/dist/release/incubator/openwhisk/) for OpenWhisk.

**Work bulletins**:
- Migrate artifacts from the staging repository to Apache directory
