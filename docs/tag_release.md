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

# Tag the commit IDs in the Github repository for the project

All the hash values are available in the configuration file config.json for each OpenWhisk project. We need to tag them
with the name of the release, e.g: \<version\>-\<pre_release_version\>. Since different OpenWhisk projects may have different
naming conventions to tag their commits, this step is currently done in a manual way, but it is very important for the
release process.

Open a terminal, go the home directory of the OpenWhisk project to be released and run the following commands to tag a
certain commit:
```
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

### Be aware of Travis builds that failed for tags

After you push a tag to a Github repository for OpenWhisk project, it will kick off a Travis build job, which probably will
push the built docker images for that project into [Docker Hub](https://hub.docker.com/u/openwhisk/). If the Travis job fails,
we will fail to push the docker images, which lead to image inconsistency for our release. When you push a release tag into
each OpenWhisk project, don't forget to verify whether the Travis build succeed or not.

If the Travis job succeeds, you are all set for this step; if the Travis job fails, you need to find out the reason,
why it has failed. Empirically, it fails due to that you pushed a tag, not compliant with naming convention for that project.
Let's take the Go runtime as an example, if you name the tag after "1.11@1.13.0-incubating", the Travis build will fail,
like the error result [here](https://travis-ci.org/apache/incubator-openwhisk-runtime-go/builds/532326848). The correct tag for Go runtime in this case is like "golang1.11@1.13.0-incubating", and the successful
build is located [here](https://travis-ci.org/apache/incubator-openwhisk-runtime-go/builds/533325334).

Another reason that the Travis build fails can be there is really a bug with the Travis build. In this case, you can keep
the tag you have pushed in the Github repository, but log this issue as well. One way to compensate is to run the "docker push"
manually on your local machine to upload the image into Docker Hub. Here are the steps you need to follow for this situation:

1. Visit the private SVN repository to access the credentials for Docker Hub
If you are a PMC member, your credentials with Apache should give you the access to the [private SVN repository](https://svn.apache.org/repos/private/pmc/incubator/openwhisk/accounts).
After you login with your credentials, open the file called dockerhub.txt, and you will see the username and password to
push your local docker images. DON'T misuse it.

2. On your local machine, run the command as below to login the Docker Hub:

```shell
docker login --username <openwhisk_username>
```

The argument \<openwhisk_username\> is the username you retrieve in the file dockerhub.txt. This command asks you to enter
the password, we can get in the file dockerhub.txt as well.

3. Build the docker image locally with correct version number and push it into the Docker hub. You need to 
go to the home directory of the specific OpenWhisk project, and run the following command:

```shell
./gradlew :core:<runtime_kind>:distDocker -PdockerRegistry=docker.io -PdockerImagePrefix=openwhisk -PdockerImageTag=<tag>
```

The argument \<runtime_kind\> is the folder name for each version of the runtime. You can find the name by checking what
are under the folder core. For example, your want to find the runtime kind for the runtime Ruby, there are ruby2.5Action
and ruby2.6ActionLoop under the [core folder](https://github.com/apache/incubator-openwhisk-runtime-ruby/tree/master/core). The candidates
for \<runtime_kind\> will be ruby2.5Action or ruby2.6ActionLoop. The argument \<tag\> is usually \<version\>-\<pre_release_version\>,
the real full version we specify for each release.
