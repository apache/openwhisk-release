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

# Release Prerequisites

## Operating Systems

This project is only supported under Mac or Ununtu operating system.

## Download the source code

Open a terminal, go to the directory where you save the source code of this release tool, and run

```
$ git clone https://github.com/apache/openwhisk-release.git
```

The directory _openwhisk-release_ becomes the home directory of openwhisk release tool, which will be referred to
in the following context.

## Install the dependencies

After running the "git clone" command to download the source code this release repository, you need to run the following
command to install all the dependencies:

```
$ cd openwhisk-release/tools
$ ./install_dependencies.sh
```

For some old versions of Ubuntu, you probably need to run _sudo apt-get update_ before running the script to install
dependencies.

Your local machine should have the following packages, if the dependencies are installed:

 - svn
 - jq
 - gpg or gnupg and expect
