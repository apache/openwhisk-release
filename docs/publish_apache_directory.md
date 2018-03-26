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

# Publish the release artifacts to Apache release directory

## Move the artifacts from the staging directory to the Apache release directory

We shall not proceed this step unless we have reached the consent from the community to promote a release. Run the following
script under _tools_ to accomplish this task:
```
$ ./move_stage_to_release.sh
```

## Tag the release in git

All the hash values are available in the configuration file config.json for each OpenWhisk project. We need to tag them
with the name of the release, e.g: \<version\>-\<pre_release_version\>.
