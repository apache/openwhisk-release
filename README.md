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

# Apache OpenWhisk Project Release Management

[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![Build Status](https://travis-ci.org/apache/openwhisk-release.svg?branch=master)](https://travis-ci.org/apache/openwhisk-release)

This project provides the Apache OpenWhisk project's Release Managers with the instructions and automation needed to ensure project releases comply with both the Apache Software Foundation's (ASF) [Release Creation Process](http://www.apache.org/dev/release-publishing.html) and [Release Policy](http://www.apache.org/legal/release-policy.html).

Specifically, this project documents the steps a Release Manager must take to make a release of an OpenWhisk software component and where possible provides scripts and tool support to reduce the number of manual steps and potential for human error during the process. Script support is provided for:
- Packaging and signing source code (compressed archives)
- Verification of LICENSE and NOTICE files, source code license headers, and other formal aspects of a release candidate
- Publishing release artifacts to the proper staging and release Apache distribution servers
- Generation of a VOTE email for a release candidate

# Release Process

## Methodology

All release artifacts must be built and signed by a project Release Manager on their own machine to ensure proper security of signing keys and the integrity of the release artifacts.

## Being a Release Manager

Any OpenWhisk committer may take on the role of a Release Manager.  The first time you serve as a Release Manager, you will need to prepare your machine by following the [Release Manager Setup Instructions](docs/release_manager_setup.md).

## Details of Making a Release

Please follow the process described in the [Detailed Instructions for Release Managers](docs/release_instructions.md).

## Publishing Release Candidates and Releases

Release candidates of Apache OpenWhisk components are published to the [release candidate staging area](https://dist.apache.org/repos/dist/dev/openwhisk) during the voting process. *These release candidates are not Apache Releases and are not intended for end users.*

If a release candidate is formally approved for release, it will be removed from the staging area, distributed from the [release distribution server](https://dist.apache.org/repos/dist/release/openwhisk/), and listed on the [Apache OpenWhisk Downloads page](https://http://openwhisk.apache.org/downloads).

# Apache OpenWhisk Git Repository Status

The following table can be used by Release Managers to check the status of all project repositories that produced releasable software components:

<table cellpadding="8">
<tbody>
<tr>
<th width="300">Repository</th>
<th width="120">Travis <sub>(Master)</sub></th>
<th width="110">ASF LICENSE</th>
<th width="120">ASF NOTICE</th>
<th width="120">Slack Channel</th>
<th><a href="https://github.com/apache/openwhisk-utilities/tree/master/scancode">ScanCode</a></th>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk">openwhisk</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk/branches"><img src="https://travis-ci.org/apache/openwhisk.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://openwhisk-team.slack.com/messages/C3TPCAQG1/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk/blob/master/tools/travis/scan.sh">scan.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-catalog">openwhisk-catalog</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk-catalog/branches"><img src="https://travis-ci.org/apache/openwhisk-catalog.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-catalog/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-catalog/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/openwhisk-catalog/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-apigateway">openwhisk-apigateway</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk-apigateway/branches"><img src="https://travis-ci.org/apache/openwhisk-apigateway.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-apigateway/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-apigateway/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://openwhisk-team.slack.com/messages/C3TP33Y2U/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-apigateway/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-cli">openwhisk-cli</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk-cli/branches"><img src="https://travis-ci.org/apache/openwhisk-cli.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-cli/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-cli/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/openwhisk-cli/blob/master/tools/travis/test_openwhisk.sh">test_openwhisk.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-client-go">openwhisk-client-go</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk-client-go/branches"><img src="https://travis-ci.org/apache/openwhisk-client-go.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-client-go/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-client-go/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/openwhisk-client-go/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-composer">openwhisk-composer</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk-composer/branches"><img src="https://travis-ci.org/apache/openwhisk-composer.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-composer/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-composer/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://openwhisk-team.slack.com/messages/C7DJNS37W/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-composer/blob/master/travis/scancode.sh">scancode.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-wskdeploy">openwhisk-wskdeploy</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk-wskdeploy/branches"><img src="https://travis-ci.org/apache/openwhisk-wskdeploy.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-wskdeploy/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-wskdeploy/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://openwhisk-team.slack.com/messages/C3TP33Y2U/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-wskdeploy/blob/master/tools/travis/scancode.sh">scancode.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-deploy-kube">openwhisk-deploy-kube</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk-deploy-kube/branches"><img src="https://travis-ci.org/apache/openwhisk-deploy-kube.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-deploy-kube/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-deploy-kube/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://openwhisk-team.slack.com/messages/C4J3R7JFL/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-deploy-kube/blob/master/tools/travis/scancode.sh">scancode.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-nodejs">openwhisk-runtime-nodejs</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk-runtime-nodejs/branches"><img src="https://travis-ci.org/apache/openwhisk-runtime-nodejs.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-nodejs/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-nodejs/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/openwhisk-runtime-nodejs/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-swift"> openwhisk-runtime-swift</a></td>
<td align="left"><a href="https://travis-ci.org/apache/openwhisk-runtime-swift/branches"><img src="https://travis-ci.org/apache/openwhisk-runtime-swift.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-swift/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-swift/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/openwhisk-runtime-swift/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-docker">openwhisk-runtime-docker</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk-runtime-docker/branches"><img src="https://travis-ci.org/apache/openwhisk-runtime-docker.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-docker/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-docker/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/openwhisk-runtime-docker/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-java">openwhisk-runtime-java</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk-runtime-java/branches"><img src="https://travis-ci.org/apache/openwhisk-runtime-java.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-java/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-java/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/openwhisk-runtime-java/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-php">openwhisk-runtime-php</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk-runtime-php/branches"><img src="https://travis-ci.org/apache/openwhisk-runtime-php.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-php/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-php/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/openwhisk-runtime-php/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-python">openwhisk-runtime-python</a></td>
<td><a href="https://travis-ci.org/apache/openwhisk-runtime-python/branches"><img src="https://travis-ci.org/apache/openwhisk-runtime-python.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-python/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-python/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/openwhisk-runtime-python/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
</tbody>
</table>

### Status notes:
- The Travis build status badge is hyperlinked to the corresponding repository's Travis CI dashboard's  "branches" page.
- The ASF License badge is hyperlinked to the corresponding repository's LICENSE file.
- The ASF NOTICE column text links to the corresponding repository's NOTICE file.
- The ScanCode column text is hyperlinked to the corresponding repository's build file that executes the scancode utility.
  - The ASF scan configuration for all repos. can be found here: [ASF-Release.cfg](https://github.com/apache/openwhisk-utilities/blob/master/scancode/ASF-Release.cfg).
- The Slack badge is hyperlinked to the corresponding repository's public Slack channel (if one exists).
- LICENSE and NOTICE file process and compliance tracking can be found here: [license_compliance.md](docs/license_compliance.md)

# References
- [Apache Release Creation Process](http://www.apache.org/dev/release-publishing.html)
- [Apache Release Policy](http://www.apache.org/legal/release-policy.html)
