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
[![Build Status](https://travis-ci.org/apache/incubator-openwhisk-release.svg?branch=master)](https://travis-ci.org/apache/incubator-openwhisk-release)

The primary goal of this project is to provide the Apache OpenWhisk project's Release Managers the instructions and automation needed to guarantee a release complies with both the Apache Software Foundation's (ASF) [Release Creation Process](http://www.apache.org/dev/release-publishing.html) and [Release Policy](http://www.apache.org/legal/release-policy.html).

Specifically, this repository provides Release Management of all designated Apache OpenWhisk project repositories, by automating:
- Verification of the source code LICENSE and NOTICE files
- Building & deploying the OpenWhisk platform
- Running Build Verification Tests (BVT)
- Generating CHANGELOGs for each project repository (since last release)
- Packaging and signing source code (compressed archives) and binaries
- publishing the artifacts to the approved Apache directories

all in accordance with Apache guidelines.


# Release Process

## Methodology

This project uses Travis CI as the automated integration build tool to streamline the release process of Apache OpenWhisk. Stages can be applied to build different jobs, which are able to run either in sequential or parallel. Artifacts can be shared across different jobs by using the cache feature in Travis, as different jobs run on different virtual machines.

## Instructions

Please follow the [Instructions for Release Managers](docs/release_instructions.md).

## Publishing

Staged candidate releases of Apache OpenWhisk artifacts are published to the approved staging repository path under Apache with all required PGP singatures:
- https://dist.apache.org/repos/dist/dev/incubator/openwhisk/

Once candidates are approved, in accordance with required release processes and policies, their artifacts can be moved from the staging path to the approved release path:
- https://dist.apache.org/repos/dist/release/incubator/openwhisk/


# Project status

The following table can be used by Release Managers to get quickly check the status of all project repositories that are currently included the current release plan:

<table cellpadding="8">
<tbody>
<tr>
<th width="300">Repository</th>
<th width="120">Travis <sub>(Master)</sub></th>
<th width="110">ASF LICENSE</th>
<th width="120">ASF NOTICE</th>
<th width="120">Slack Channel</th>
<th><a href="https://github.com/apache/incubator-openwhisk-utilities/tree/master/scancode">ScanCode</a></th>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk">incubator-openwhisk</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://openwhisk-team.slack.com/messages/C3TPCAQG1/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk/blob/master/tools/travis/scan.sh">scan.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-catalog">incubator-openwhisk-catalog</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-catalog/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-catalog.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-catalog/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-catalog/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/incubator-openwhisk-catalog/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-apigateway">incubator-openwhisk-apigateway</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-apigateway/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-apigateway.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-apigateway/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-apigateway/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://openwhisk-team.slack.com/messages/C3TP33Y2U/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-apigateway/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-cli">incubator-openwhisk-cli</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-cli/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-cli.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-cli/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-cli/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/incubator-openwhisk-cli/blob/master/tools/travis/test_openwhisk.sh">test_openwhisk.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-client-go">incubator-openwhisk-client-go</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-client-go/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-client-go.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-client-go/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-client-go/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/incubator-openwhisk-client-go/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-composer">incubator-openwhisk-composer</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-composer/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-composer.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-composer/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-composer/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://openwhisk-team.slack.com/messages/C7DJNS37W/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-composer/blob/master/travis/scancode.sh">scancode.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-wskdeploy">incubator-openwhisk-wskdeploy</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-wskdeploy/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-wskdeploy.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-wskdeploy/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-wskdeploy/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://openwhisk-team.slack.com/messages/C3TP33Y2U/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-wskdeploy/blob/master/tools/travis/scancode.sh">scancode.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-deploy-kube">incubator-openwhisk-deploy-kube</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-deploy-kube/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-deploy-kube.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-deploy-kube/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-deploy-kube/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://openwhisk-team.slack.com/messages/C4J3R7JFL/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-deploy-kube/blob/master/tools/travis/scancode.sh">scancode.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs">incubator-openwhisk-runtime-nodejs</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-runtime-nodejs/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-runtime-nodejs.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-swift"> incubator-openwhisk-runtime-swift</a></td>
<td align="left"><a href="https://travis-ci.org/apache/incubator-openwhisk-runtime-swift/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-runtime-swift.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-docker">incubator-openwhisk-runtime-docker</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-runtime-docker/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-runtime-docker.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-docker/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-docker/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-docker/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-java">incubator-openwhisk-runtime-java</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-runtime-java/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-runtime-java.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-java/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-java/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-java/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-php">incubator-openwhisk-runtime-php</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-runtime-php/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-runtime-php.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-php/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-php/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-php/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-python">incubator-openwhisk-runtime-python</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-runtime-python/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-runtime-python.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-python/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-python/blob/master/NOTICE.txt">NOTICE</a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-python/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
</tbody>
</table>

### Status notes:
- The Travis build status badge is hyperlinked to the corresponding repository's Travis CI dashboard's  "branches" page.
- The ASF License badge is hyperlinked to the corresponding repository's LICENSE file.
- The ASF NOTICE column text links to the corresponding repository's NOTICE file.
- The ScanCode column text is hyperlinked to the corresponding repository's build file that executes the scancode utility.
  - The ASF scan configuration for all repos. can be found here: [ASF-Release.cfg](https://github.com/apache/incubator-openwhisk-utilities/blob/master/scancode/ASF-Release.cfg).
- The Slack badge is hyperlinked to the corresponding repository's public Slack channel (if one exists).
- LICENSE and NOTICE file process and compliance tracking can be found here: [license_compliance.md](docs/license_compliance.md)

# References
- [Apache Release Creation Process](http://www.apache.org/dev/release-publishing.html)
- [Apache Release Policy](http://www.apache.org/legal/release-policy.html)

# Disclaimer
This project is still "in development" with many steps still in the process of being automated and brought into compliance. We welcome any reviews, comments or contributions to help us complete and improve any part of the process.
