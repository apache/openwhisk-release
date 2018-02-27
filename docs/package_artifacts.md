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

# Making the release artifacts

The artifacts to be made in this step consists of the source code packages, binary packages and docker image packages.
As the deliverable of the [first phase](general_spec.md#different-phases-of-implementations), we currently only build the
source code packages. Binary and docker image are on our future agenda.

After downloading the source code, we can run the following script under _tools_ to generate the artifacts for each OpenWhisk project:
```
$ ./package_source_code.sh <WORK_DIR>
```
The <WORK_DIR> should be the same one used to download the source code. This script will create a source code package file
of source code suffixed with tar.gz for each project, under <WORK_DIR>/openwhisk_sources/openwhisk/openwhisk-\<major\>-\<minor\>.
The keys major and minor are defined in _config.json_.
