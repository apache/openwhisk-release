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

## Release verification tools

The script [rcverify.sh](../tools/rcverify.sh) is available to automate the process of verifying a release.

The script will download the release candidate, verify signatures, notice, and license. The tool assumes that are no executable files in the release and will flag any executable that it finds. If the tool discovers an issue during verification, it will try to emit useful information for you to further inspect the findings. The release is left on your disk for you to further inspect and you must delete the scratch space when finished.

Example of how to use `rcverify.sh`:
```
rcverify.sh openwhisk-client-js 'OpenWhisk Client Js' 3.20.0 rc2

TODO: put updated script output here
```
