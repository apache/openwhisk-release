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

# Picking up source code

## Edit the configuration file

The only file that a release manager needs to edit is the JSON-format configuration file named _config.json_ under the
folder _tools_. You can specify the the staging url, release url, the list of projects to be release, the repository url,
branch name, and hash value of the source code for each project, etc.

Template of [_config.json_](../tools/config.json):

```
{
  "stage_url": "https://dist.apache.org/repos/dist/dev/incubator/openwhisk",
  "release_url": "https://dist.apache.org/repos/dist/release/incubator/openwhisk",
  "version": {
    "major": "incubator",
    "minor": "rc1"
  },
  "RepoList": [
    "incubator-openwhisk",
    "incubator-openwhisk-wskdeploy",
    "incubator-openwhisk-cli"
  ],
  "incubator_openwhisk": {
    "hash": "a891e06",
    "repository": "https://github.com/apache/incubator-openwhisk.git",
    "branch": "master"
  },
  "incubator_openwhisk_wskdeploy": {
    "hash": "1425456",
    "repository": "https://github.com/apache/incubator-openwhisk-wskdeploy.git",
    "branch": "master"
  },
  "incubator_openwhisk_cli": {
    "hash": "1448d31",
    "repository": "https://github.com/apache/incubator-openwhisk-cli.git",
    "branch": "master"
  }
}
```
  - **stage_url**: the field to specify the staging url, where to upload the artifacts.
  - **release_url**: the field to specify the Apache release directory url, where to finally release the artifacts.
  - **version**: the key to define the release name, with both a major and a minor name.
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
$ ./download_source_code.sh <WORK_DIR>
```
You may specify where to download all the source code with <WORK_DIR>. If you specify the <WORK_DIR> here, you need to
specify the same value as well to the sequential scripts as well. It will take $HOME by default.

## Checkout the subversion repository

We need to checkout the subversion repository for OpenWhisk to stage the artifacts with the following command:
```
$ ./checkout_svn.sh <WORK_DIR> <SVN_USERNAME> <SVN_PASSWORD>
```

The <WORK_DIR> should be the same one used to download the source code. If you have already configured your local
svn command with a pair of username and password, there is no need to provide the values for the arguments <SVN_USERNAME>
and <SVN_PASSWORD>. With this command, a remote folder named openwhisk-$version will be created in the subversion
repository if necessary, and checked out to the local folder <WORK_DIR>/openwhisk_release/openwhisk/openwhisk-$version.
The value of $version is $major-$minor, as defined in config.json. This command can also be used to sync-up your local
folder with the remote subversion folder.