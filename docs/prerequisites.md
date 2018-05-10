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

## Software packages

The following software packages are required for your operating system.

 - git and svn
 - jq
 - gpg or gnupg and expect

## Download the source code

Open a terminal, go to the directory where you save the source code, and run
```
$ git clone https://github.com/apache/incubator-openwhisk-release.git
```

## Install the dependencies

Normally, Mac or Ubuntu will have some the packages installed by default. Suppose _$OPENWHISK_RELEASE_ is the home directory
of openwhisk release on your local machine. You can run the script _install_dependencies.sh_ under the folder _tools_
to install the software packages:
```
$ cd $OPENWHISK_RELEASE/tools
$ ./install_dependencies.sh
```

For some old versions of Ubuntu, you probably need to run _sudo apt-get update_ before running the script to install
dependencies.
