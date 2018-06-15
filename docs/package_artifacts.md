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

# Package the artifacts

## Verify the source code

Before generating any release artifacts, it is recommended to verify the source code by checking the license headers and
the existence of LICENSE and NOTICE files under each repository. This step can be done by running the following script
under the directory _tools_:
```
$ ./verify_source_code.sh
```
This script will generate a RAT report called rat.txt under the directory <local_release_dir>/openwhisk_release/openwhisk_sources/target. You can find the status of license
header in this RAT report. In addition, you can check the existence of LICENSE and NOTICE from the terminal, after
running this script.

## Making the release artifacts

The artifacts to be made in this step consists of the source code packages, binary packages and docker image packages.
As the deliverable of the [first phase](general_spec.md#different-phases-of-implementations), we currently only build the
source code packages. Binary and docker image are on our future agenda.

After downloading the source code, we can run the following script under _tools_ to generate the artifacts for each OpenWhisk project:
```
$ ./package_source_code.sh
```
This script will create a source code package file of source code suffixed with tar.gz for each project, under <local_release_dir>/openwhisk_sources/openwhisk/openwhisk-\<version\>.
The key version is defined in _config.json_.
