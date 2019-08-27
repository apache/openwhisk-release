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

# Picking up source code

## Edit the configuration file

The only file that a release manager needs to edit is the JSON-format configuration file named _config.json_ under the
folder _tools_. You can specify the the staging url, release url, the list of projects to be release, the repository url,
branch name, and hash value of the source code for each project, etc.

Template of [_config.json_](../tools/config.json):

```
{
  "publish_stage": "false",
  "stage_url": "https://dist.apache.org/repos/dist/dev/openwhisk",
  "release_url": "https://dist.apache.org/repos/dist/release/openwhisk",
  "versioning": {
    "version": "",
    "pre_release_version": "rc1"
  },
  "RepoList": [
    "openwhisk",
    "openwhisk-wskdeploy",
    "openwhisk-cli"
  ],
  "openwhisk": {
    "hash": "a891e06",
    "repository": "https://github.com/apache/openwhisk.git",
    "branch": "master"
  },
  "openwhisk_wskdeploy": {
    "hash": "1425456",
    "repository": "https://github.com/apache/openwhisk-wskdeploy.git",
    "branch": "master"
  },
  "openwhisk_cli": {
    "hash": "1448d31",
    "repository": "https://github.com/apache/openwhisk-cli.git",
    "branch": "master"
  }
}
```
  - **publish_stage**: the field to specify whether the Travis build in master will upload the new artifacts to the staging
  URL or not. If it is set to false, the Travis build in master will not upload the artifacts. If it is set to true, the
  Travis build in master will upload the artifacts.
  - **stage_url**: the field to specify the staging url, where to upload the artifacts.
  - **release_url**: the field to specify the Apache release directory url, where to finally release the artifacts.
  - **versioning**: the key to define the release name, with both a version and a pre-release version name.
  - **RepoList**: the key to define the list of OpenWhisk projects to be released. Based on this key, we need to add other
  keys below with each of them matching each project name. For example, we define three projects in _RepoList_, so we
  have three other keys below to match each project.
  - **<project_name>**: the key used to match one OpenWhisk project. If there is any hyphen(-) sign in the project name, we need
  to convert it into underscore(_). Hash key defines the hash value, repository defines the url of the project repository,
  and branch defines the branch name in the project repository. We can precisely locate a version of the source code to
  pick up for the release.

## Download the source code to a local directory

Run the following script to download source code based on the configuration in _config.json_:

```
$ ./download_source_code.sh
```

After this script is executed, a directory called _stagingArea_ will be created under the home directory of openwhisk
release tool, if it is not available. The directory _stagingArea_ will save the output files, including the source code
of all the OpenWhisk repositories, packages to be rleased, signature, checksums, etc, when we run any bash script of this
release tool.
