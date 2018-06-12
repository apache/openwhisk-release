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

# Prepare OpenWhisk projects for a release

  1. Make sure all unit and integration tests are passing in all the projects to be release. Check the [project list](general_spec.md#list-of-openwhisk-repositories-to-be-released).
  2. Make sure the license file LICENSE.txt and the notice file NOTICE.txt exist in each project repository. The license
  file contains the Apache V2.0 license and the notice file includes the dependencies.
  3. Update the release notes. (It is still to be determined where to publish the release notes)
  4. Update the changelog file CHANGELOG.txt for each project, including the new commits based on the previous release.
  5. Create a JIRA issue at [issue of ASF JIRA](https://issues.apache.org/jira/), to track this release. This issue will be closed, if the release is approved.
