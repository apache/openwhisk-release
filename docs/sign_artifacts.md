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

# Sign the artifacts

Each package needs to be accompanied by cryptographic signatures according to Apache release policy.

## Sign the artifacts:

All the artifacts can be signed by running the following script under _tools_:

```
$ ./sign_artifacts.sh <SVN_USERNAME> <SVN_PASSWORD>
```
                      
If you have configured your local SVN with the username and the password, you can run the above script without the parameters.

This script generates a file of the SHA512 checksum suffixed with .sha512, and a signature file suffixed with .asc for each package.
