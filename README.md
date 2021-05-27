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
[![Build Status](https://travis-ci.com/apache/openwhisk-release.svg?branch=master)](https://travis-ci.com/apache/openwhisk-release)

This project provides the Apache OpenWhisk project's Release Managers with the instructions and automation needed to ensure that project releases comply with both the Apache Software Foundation's (ASF) [Release Creation Process](http://www.apache.org/dev/release-publishing.html) and [Release Policy](http://www.apache.org/legal/release-policy.html).

Specifically, this project documents the steps a Release Manager must take to make a release of an OpenWhisk software component and provides scripts and tool support to reduce the number of manual steps and potential for human error during the release process. Script support is provided for:
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

If a release candidate is formally approved for release, it will be removed from the staging area, distributed from the [release distribution server](https://dist.apache.org/repos/dist/release/openwhisk/), and listed on the [Apache OpenWhisk Downloads page](https://openwhisk.apache.org/downloads).

# Apache OpenWhisk Git Repository Status

The following table can be used by Release Managers to check the status of all project repositories that produced releasable software components:

<table cellpadding="8">
<tbody>
<tr>
<th width="300">Repository</th>
<th width="120">Travis <sub>(Master)</sub></th>
<th width="110">ASF LICENSE</th>
<th width="120">ASF NOTICE</th>
<th><a href="https://github.com/apache/openwhisk-utilities/tree/master/scancode">ScanCode</a></th>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk">openwhisk</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk/branches"><img src="https://travis-ci.com/apache/openwhisk.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk/blob/master/tools/travis/scan.sh">scan.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-apigateway">openwhisk-apigateway</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-apigateway/branches"><img src="https://travis-ci.com/apache/openwhisk-apigateway.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-apigateway/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-apigateway/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-apigateway/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-catalog">openwhisk-catalog</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-catalog/branches"><img src="https://travis-ci.com/apache/openwhisk-catalog.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-catalog/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-catalog/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-catalog/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-cli">openwhisk-cli</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-cli/branches"><img src="https://travis-ci.com/apache/openwhisk-cli.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-cli/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-cli/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-cli/blob/master/tools/travis/test_openwhisk.sh">test_openwhisk.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-client-go">openwhisk-client-go</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-client-go/branches"><img src="https://travis-ci.com/apache/openwhisk-client-go.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-client-go/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-client-go/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-client-go/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-client-js">openwhisk-client-js</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-client-js/branches"><img src="https://travis-ci.com/apache/openwhisk-client-js.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-client-js/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-client-js/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-client-js/blob/master/tools/travis/scancode.sh">scancode.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-composer">openwhisk-composer</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-composer/branches"><img src="https://travis-ci.com/apache/openwhisk-composer.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-composer/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-composer/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-composer/blob/master/travis/scancode.sh">scancode.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-deploy-kube">openwhisk-deploy-kube</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-deploy-kube/branches"><img src="https://travis-ci.com/apache/openwhisk-deploy-kube.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-deploy-kube/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-deploy-kube/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-deploy-kube/blob/master/tools/travis/scancode.sh">scancode.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-package-alarms">openwhisk-package-alarms</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-package-alarms/branches"><img src="https://travis-ci.com/apache/openwhisk-package-alarms.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-package-alarms/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-package-alarms/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-package-alarms/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-package-cloudant">openwhisk-package-cloudant</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-package-cloudant/branches"><img src="https://travis-ci.com/apache/openwhisk-package-cloudant.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-package-cloudant/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-package-cloudant/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-package-cloudant/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-package-kafka">openwhisk-package-kafka</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-package-kafka/branches"><img src="https://travis-ci.com/apache/openwhisk-package-kafka.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-package-kafka/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-package-kafka/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-package-kafka/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-docker">openwhisk-runtime-docker</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-runtime-docker/branches"><img src="https://travis-ci.com/apache/openwhisk-runtime-docker.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-docker/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-docker/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-docker/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-dotnet">openwhisk-runtime-dotnet</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-runtime-dotnet/branches"><img src="https://travis-ci.com/apache/openwhisk-runtime-dotnet.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-dotnet/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-dotnet/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-dotnet/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-go">openwhisk-runtime-go</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-runtime-go/branches"><img src="https://travis-ci.com/apache/openwhisk-runtime-go.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-go/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-go/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-go/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-java">openwhisk-runtime-java</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-runtime-java/branches"><img src="https://travis-ci.com/apache/openwhisk-runtime-java.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-java/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-java/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-java/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-nodejs">openwhisk-runtime-nodejs</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-runtime-nodejs/branches"><img src="https://travis-ci.com/apache/openwhisk-runtime-nodejs.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-nodejs/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-nodejs/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-nodejs/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-php">openwhisk-runtime-php</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-runtime-php/branches"><img src="https://travis-ci.com/apache/openwhisk-runtime-php.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-php/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-php/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-php/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-python">openwhisk-runtime-python</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-runtime-python/branches"><img src="https://travis-ci.com/apache/openwhisk-runtime-python.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-python/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-python/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-python/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-ruby">openwhisk-runtime-ruby</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-runtime-ruby/branches"><img src="https://travis-ci.com/apache/openwhisk-runtime-ruby.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-ruby/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-ruby/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-ruby/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-rust">openwhisk-runtime-rust</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-runtime-rust/branches"><img src="https://travis-ci.com/apache/openwhisk-runtime-rust.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-rust/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-rust/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-rust/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-runtime-swift"> openwhisk-runtime-swift</a></td>
<td align="left"><a href="https://travis-ci.com/apache/openwhisk-runtime-swift/branches"><img src="https://travis-ci.com/apache/openwhisk-runtime-swift.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-swift/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-swift/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-runtime-swift/blob/master/tools/travis/build.sh">build.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-wskdebug">openwhisk-wskdebug</a></td>
<td><a href="https://travis-ci.com/apache/openwhisk-wskdebug"><img src="https://travis-ci.com/apache/openwhisk-wskdebug.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-wskdebug/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-wskdebug/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-wskdebug/blob/master/travis/scancode.sh">scancode.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-vscode-extension">openwhisk-vscode-extension</a></td>
<td><a href="https://travis-ci.com/github/apache/openwhisk-vscode-extension/branches"><img src="https://github.com/apache/openwhisk-vscode-extension/actions/workflows/node.js.yml/badge.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-vscode-extension/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-vscode-extension/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-vscode-extension/blob/master/travis/scancode.sh">scancode.sh</a></td>
</tr>
<tr align="left">
<td><a href="https://github.com/apache/openwhisk-intellij-plugin">openwhisk-intellij-plugin</a></td>
<td><a href="https://travis-ci.com/github/apache/openwhisk-intellij-plugin/branches"><img src="https://github.com/apache/openwhisk-intellij-plugin/actions/workflows/gradle.yml/badge.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-intellij-plugin/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/openwhisk-intellij-plugin/blob/master/NOTICE.txt">NOTICE</a></td>
<td><a href="https://github.com/apache/openwhisk-intellij-plugin/blob/master/travis/scancode.sh">scancode.sh</a></td>
</tr>
</tbody>
</table>

### Status notes:
- The Travis build status badge is hyperlinked to the corresponding repository's Travis CI dashboard's  "branches" page.
- The ASF License badge is hyperlinked to the corresponding repository's LICENSE file.
- The ASF NOTICE column text links to the corresponding repository's NOTICE file.
- The ScanCode column text is hyperlinked to the corresponding repository's build file that executes the scancode utility.
  - The ASF scan configuration for all repos. can be found here: [ASF-Release.cfg](https://github.com/apache/openwhisk-utilities/blob/master/scancode/ASF-Release.cfg).

# References
- [Apache Release Creation Process](http://www.apache.org/dev/release-publishing.html)
- [Apache Release Policy](http://www.apache.org/legal/release-policy.html)
- [Apache OpenWhisk Project License Header Policy](docs/license_compliance.md)
