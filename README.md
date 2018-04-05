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

# OpenWhisk Graduate and Release Management

[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![Build Status](https://travis-ci.org/apache/incubator-openwhisk-release.svg?branch=master)](https://travis-ci.org/apache/incubator-openwhisk-release)

The primary goal of this project is to provide the Apache OpenWhisk project's Release Managers the automation needed to guarantee a release complies with both the Apache Software Foundation's (ASF) [Release Creation Process](http://www.apache.org/dev/release-publishing.html) and [Release Policy](http://www.apache.org/legal/release-policy.html).

Specifically, this repository provides Release Management of all designated Apache OpenWhisk project repositories, by automating:
- Verification of the source code LICENSE and NOTICE files
- Building & deploying the OpenWhisk platform
- Running Build Verification Tests (BVT)
- Generating CHANGELOGs for each project repository (since last release)
- Packaging and signing source code (compressed archives) and binaries
- publishing the artifacts to the approved Apache directories

all in accordance with Apache guidelines.

## Release Process Methodology

This project uses Travis CI as the automated integration build tool to streamline the release process of Apache OpenWhisk. Stages can be applied to build different jobs, which are able to run either in sequential or parallel. Artifacts can be shared across different jobs by using the cache feature in Travis, as different jobs run on different virtual machines.

## Release publishing

Staged candidate releases of Apache OpenWhisk artifacts are published to the approved staging repository path under Apache with all required PGP singatures:
- https://dist.apache.org/repos/dist/dev/incubator/openwhisk/

Once candidates are approved, in accordance with required release processes and policies, their artifacts can be moved from the staging path to the approved release path:
- https://dist.apache.org/repos/dist/release/incubator/openwhisk/.

# Instructions for Release Managers

## Release Manager Tutorial
As a release manger of OpenWhisk, please visit [OpenWhisk Release tutorial](docs/tutorial.md).


# Specifications to implement the above release process

To find the specifications about how to implement the Apache Release process for OpenWhisk project set, please visit the following page.

- [General Specification](docs/general_spec.md)

# Project status

The following table can be used by Release Managers to get quickly check the status of all project repositories that are currently included the current release plan:

<table cellpadding="8">
<tbody>
<tr>
<th width="300">Repository</th>
<th width="120">Travis <sub>(Master)</sub></th>
<th width="120">ASF LICENSE</th>
<th width="120">Slack Channel</th>
<th><a href="https://github.com/apache/incubator-openwhisk-utilities/tree/master/scancode">ScanCode</a></th>
</tr>
<tr>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk">incubator-openwhisk</a></p>
</td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk.svg?branch=master" alt="" /></a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></p>
</td>
<td><a href="https://openwhisk-team.slack.com/messages/C3TPCAQG1/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk/blob/master/tools/travis/build.sh">Yes</a></td>
</tr>
<tr>
<td><a href="https://github.com/apache/incubator-openwhisk-catalog">incubator-openwhisk-catalog</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-catalog/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-catalog.svg?branch=master" alt="" /></a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-catalog/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></p>
</td>
<td>&nbsp;</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-catalog/blob/master/tools/travis/build.sh">Yes</a></p>
</td>
</tr>
<tr>
<td>i<a href="https://github.com/apache/incubator-openwhisk-apigateway">ncubator-openwhisk-apigateway</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-apigateway/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-apigateway.svg?branch=master" alt="" /></a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-apigateway/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></p>
</td>
<td><a href="https://openwhisk-team.slack.com/messages/C3TP33Y2U/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-apigateway/blob/master/tools/travis/build.sh">Yes</a></td>
</tr>
<tr>
<td><a href="https://github.com/apache/incubator-openwhisk-cli">incubator-openwhisk-cli</a></td>
<td>
<p><a href="https://travis-ci.org/apache/incubator-openwhisk-cli/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-cli.svg?branch=master" alt="" /></a></p>
</td>
<td><a href="https://github.com/apache/incubator-openwhisk-cli/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/incubator-openwhisk-cli/blob/master/tools/travis/scancode.sh">Yes</a></td>
</tr>
<tr>
<td><a href="https://github.com/apache/incubator-openwhisk-client-go">incubator-openwhisk-client-go</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-client-go/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-client-go.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-client-go/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td>&nbsp;</td>
<td><a href="https://github.com/apache/incubator-openwhisk-client-go/blob/master/tools/travis/build.sh">Yes</a></td>
</tr>
<tr>
<td><a href="https://github.com/apache/incubator-openwhisk-wskdeploy">incubator-openwhisk-wskdeploy</a></td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-wskdeploy/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-wskdeploy.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-wskdeploy/blob/master/LICENSE.txt"><img src="https://img.shields.io/badge/license-Apache--2.0-blue.svg" alt="" /></a></td>
<td><a href="https://openwhisk-team.slack.com/messages/C3TP33Y2U/"><img src="https://img.shields.io/badge/channel-Slack-800080.svg" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-wskdeploy/blob/master/tools/travis/scancode.sh">Yes</a></td>
</tr>
<tr>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs">incubator-openwhisk-runtime-nodejs</a></p>
</td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-runtime-nodejs/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-runtime-nodejs.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td>&nbsp;</td>
<td>No</td>
</tr>
<tr>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-swift"> incubator-openwhisk-runtime-swift</a></p>
</td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-runtime-swift/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-runtime-swift.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td>&nbsp;</td>
<td>No</td>
</tr>
<tr>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-docker">incubator-openwhisk-runtime-docker</a></p>
</td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-runtime-docker/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-runtime-docker.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-docker/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td>&nbsp;</td>
<td>No</td>
</tr>
<tr>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-java">incubator-openwhisk-runtime-java</a></p>
</td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-runtime-java/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-runtime-java.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-java/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td>&nbsp;</td>
<td>No</td>
</tr>
<tr>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-php">incubator-openwhisk-runtime-php</a></p>
</td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-runtime-php/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-runtime-php.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-php/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td>&nbsp;</td>
<td>No</td>
</tr>
<tr>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-python">incubator-openwhisk-runtime-python</a></p>
</td>
<td><a href="https://travis-ci.org/apache/incubator-openwhisk-runtime-python/branches"><img src="https://travis-ci.org/apache/incubator-openwhisk-runtime-python.svg?branch=master" alt="" /></a></td>
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-python/blob/master/LICENSE.txt"><img src="https://camo.githubusercontent.com/3a4d3bc039085cffdfecbe3077ffe49c5fe23286/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4170616368652d2d322e302d626c75652e737667" alt="" /></a></td>
<td>&nbsp;</td>
<td>No</td>
</tr>
</tbody>
</table>

Note:
- The Travis build status icon is hyperlinked to the corresponding repository's Travis CI dashboard's  "branches" page.
- The ASF License icon is hyperlinked to the corresponding repository's LICENSE file.

# References
- [Apache Release Creation Process](http://www.apache.org/dev/release-publishing.html)
- [Apache Release Policy](http://www.apache.org/legal/release-policy.html)

# Notes
This project is still "in development" with many steps still in the process of being automated and brought into compliance. We welcome any reviews, comments or contributions to help us complete and improve any part of the process.
