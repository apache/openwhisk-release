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

## Verifying release binaries

### Verify Travis builds succeed after tagging

After you push a tag to a Github repository for OpenWhisk project, it will kick off a Travis build job, which probably will push the built docker images for that project into [Docker Hub](https://hub.docker.com/u/openwhisk/).

> **Important!** Don't forget to verify whether the Travis build succeed or not.

- **If the Travis job fails**, we will fail to push the docker images, which lead to image inconsistency for our release.

    You need to find out the reason, why it has failed. Empirically, it fails due to that you pushed a tag, not compliant with naming convention for that project.

- **If the Travis job succeeds**, you are all set for this step.

#### Example: Runtime Go

Let's take the Go runtime as an example, if you name the tag after "1.11@1.13.0-incubating", the Travis build will fail,
like the error result [here](https://travis-ci.org/apache/openwhisk-runtime-go/builds/532326848). The correct tag for Go runtime in this case is like "golang1.11@1.13.0-incubating", and the successful
build is located [here](https://travis-ci.org/apache/openwhisk-runtime-go/builds/533325334).

Another reason that the Travis build fails can be there is really a bug with the Travis build. In this case, you can keep
the tag you have pushed in the Github repository, but log this issue as well. One way to compensate is to run the "docker push"
manually on your local machine to upload the image into Docker Hub. Here are the steps you need to follow for this situation:

1. Visit the private SVN repository to access the credentials for Docker Hub.
If you are a PMC member, your credentials with Apache should give you the access to the [private SVN repository](https://svn.apache.org/repos/private/pmc/openwhisk/accounts).
After you login with your credentials, open the file called `dockerhub.txt`, and you will see the username and password to push your local docker images. **DON'T misuse it.**

1. On your local machine, run the command as below to login the Docker Hub:

    ```sh
    docker login --username <openwhisk_username>
    ```

    The argument \<openwhisk_username\> is the username you retrieve in the file dockerhub.txt. This command asks you to enter the password, we can get in the file dockerhub.txt as well.

1. Build the docker image locally with correct version number and push it into the Docker hub. You need to go to the home directory of the specific OpenWhisk project, and run the following command:

    ```sh
    ./gradlew :core:<runtime_kind>:distDocker -PdockerRegistry=docker.io -PdockerImagePrefix=openwhisk -PdockerImageTag=<tag>
    ```

    The argument \<runtime_kind\> is the folder name for each version of the runtime. You can find the name by checking what are under the folder core. For example, your want to find the runtime kind for the runtime Ruby, there are `ruby2.5Action` and `ruby2.6ActionLoop` under the [core folder](https://github.com/apache/openwhisk-runtime-ruby/tree/master/core).

    The candidates for \<runtime_kind\> will be `ruby2.5Action` or `ruby2.6ActionLoop`. The argument \<tag\> is usually \<version\>-\<pre_release_version\>, the real full version we specify for each release.
