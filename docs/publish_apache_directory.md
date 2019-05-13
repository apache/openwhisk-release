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

# Publish the release artifacts to Apache release directory

## Move the artifacts from the staging directory to the Apache release directory

We shall not proceed this step unless we have reached the consent from the community to promote a release. Run the following
script under _tools_ to accomplish this task:
```
$ ./move_stage_to_release.sh
```

## Tag the release in github

All the hash values are available in the configuration file config.json for each OpenWhisk project. We need to tag them
with the name of the release, e.g: \<version\>-\<pre_release_version\>. Since different OpenWhisk projects may have different
naming conventions to tag their commits, this step is currently done in a manual way, but it is very important for the
release process.

Open a terminal, go the home directory of the OpenWhisk project to be released and run the following commands to tag a
certain commit:
```
git tag -a <tag> -m 'Add the tag <tag> to the commit <commit ID>'
git tag <tag> <commit ID>
git push <remote_url_var> <tag>
```

Replace the notation \<tag\> with the tag name for the release of the current project. As a release manager, you should be
familiar with the tag's naming convention for the module to be released. Take the Nodejs runtime as example, you need to use
the tag like \<node kind\>@\<version\>-\<pre_release_version\>. The nonation \<node kind\> should be 8 or 10 for a specific
Nodejs version, but for OpenWhisk, you can directly use \<version\>-\<pre_release_version\> as the tag. Please make sure
you use the correct format of tags, when you release OpenWhisk modules. If you are not sure how to name the tag, ask the
OpenWhisk community.

Replace the notation \<commit ID\> with the commit ID you designated for the release of the current project. For \<commit ID\>,
you can either choose the full commit ID or the first 7 letters.

Replace the notation \<remote_url_var\> with the local variable linking to the remote repository of the OpenWhisk project.
Take OpenWhisk module as an example, we usually link the variable "origin" to the fork we are working on, and the
variable "upstream" to the remote repository of official OpenWhisk project. To push a tag, we run "git push remote \<tag\>".

To add a variable, you can run the following command as an example:
```
git remote add <remote_url_var> <full_remote_url>
```

To change an existing variable, you can run the following command as an example:
```
git remote set-url <remote_url_var> <full_remote_url>
```

If you are releasing OpenWhisk, the \<full_remote_url\> will be "git@github.com:apache/incubator-openwhisk.git" or
"https://github.com/apache/incubator-openwhisk.git".

In case of making mistakes, you may need to remove tags. You can run the following command to remove a local tag:
```
git tag -d <tag>
```

Run the following command to remove a remote tag:
```
git push --delete <remote_url_var> <tag>
```
