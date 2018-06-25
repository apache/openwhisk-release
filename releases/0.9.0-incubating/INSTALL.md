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

# Download OpenWhisk

The source code of OpenWhisk can be accessed by [this link](https://dist.apache.org/repos/dist/dev/incubator/openwhisk/apache-openwhisk-0.9.0-incubating-rc1/).
You are currently releasing the version 0.9.0, and the artifact of OpenWhisk source code is called "openwhisk-0.9.0-incubating-sources.tar.gz".


# Verify the Apache license header of OpenWhisk

OpenWhisk uses a tool called openwhisk-utilities to check the license header of each source code file. Please check the
tutorial [here](https://github.com/apache/incubator-openwhisk-utilities) about how to run it on the directory level.


# Verify the MD5 & SHA-512 checksums, and signature

You need to install gpg on your local machine.

For Ubuntu user, run the following command:

```
$ sudo apt-get install gnupg
```

For Mac user, run the following command:

```
$ brew install gpg
```

The public key used to verify the checksums can be found [here](https://dist.apache.org/repos/dist/dev/incubator/openwhisk/KEYS). After
download it, you need to import it on your local machine. 

```
$ gpg --import <key_file>
```

The parameter <key_file> is the file, where the public key is saved.


To generate the MD5 checksum:

```
$ gpg --print-md MD5 <artifact>
```

The parameter <artifact> is the file of the artifact "openwhisk-0.9.0-incubating-sources.tar.gz". Compare the content with the [MD5 file](https://dist.apache.org/repos/dist/dev/incubator/openwhisk/apache-openwhisk-0.9.0-incubating-rc1/openwhisk-0.9.0-incubating-sources.tar.gz.md5).


To generate the SHA512 checksum:

```
$ gpg --print-md SHA512 <artifact>
```

The parameter <artifact> is the file of the artifact "openwhisk-0.9.0-incubating-sources.tar.gz". Compare the content with the [SHA512 file](https://dist.apache.org/repos/dist/dev/incubator/openwhisk/apache-openwhisk-0.9.0-incubating-rc1/openwhisk-0.9.0-incubating-sources.tar.gz.sha512).

Download the [signature](https://dist.apache.org/repos/dist/dev/incubator/openwhisk/apache-openwhisk-0.9.0-incubating-rc1/openwhisk-0.9.0-incubating-sources.tar.gz.asc), and verify it with the command:

```
$ gpg --verify openwhisk-0.9.0-incubating-sources.tar.gz.asc openwhisk-0.9.0-incubating-sources.tar.gz
```


# Installation of OpenWhisk 0.9.0

This instruction walks you through the steps to install OpenWhisk 0.9.0. We support both Ubuntu and Mac operating systems.
Please download the source code package of OpenWhisk "openwhisk-0.9.0-incubating-sources.tar.gz" and unzip it, then you
get a directory called "incubator-openwhisk" on your local machine.


## Prerequisites

If you are a Ubuntu user, our suggested version is between 14.04 and 16.04. Open a terminal, go to the directory of "incubator-openwhisk",
and run the script "all.sh" under tools//ubuntu-setup:

```
$ cd incubator-openwhisk
$ ./tools/ubuntu-setup/all.sh
```

Then, you need to add the permission for the current Ubuntu user in Docker:

```
$ sudo usermod -a -G docker $USER
```

If you are a Mac user, please run the following script:

```
echo '
# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install cask
brew tap caskroom/cask
# install for finding alternative versions (java8)
brew tap caskroom/versions
# install java 8
brew cask install java8
# install scala
brew install scala
# install pip
sudo easy_install pip
# install script prerequisites
sudo -H pip install docker==2.2.1 ansible==2.5.2 jinja2==2.9.6 couchdb==1.1 httplib2==0.9.2 requests==2.10.0' | bash
```

Then, activate docker0 network with the following command:

```
$ sudo ifconfig lo0 alias 172.17.0.1/24
```

After running the script above, you should have all you need to install OpenWhisk. Normally there should be no error, but it
some error messages pop-up, please [log an issue](https://github.com/apache/incubator-openwhisk/issues) for OpenWhisk community.


## Build the source code

Stay under the directory of incubator-openwhisk, and run the following gradlew command to build the source code:

```
$ ./gradlew distDocker
```

You should be able to have all the docker images necessary to run OpenWhisk, after running this command. If you fail to build
it, first make sure docker is running correctly by verifying with the command "docker images". If the error message still
remains clueless, please [log an issue](https://github.com/apache/incubator-openwhisk/issues) for OpenWhisk community.


## Deploy OpenWhisk

Stay under the directory of incubator-openwhisk, and run the following ansible scripts one by one:

```
$ ansible-playbook -i environments/local setup.yml
$ ansible-playbook -i environments/local prereq.yml
$ ansible-playbook -i environments/local couchdb.yml
$ ansible-playbook -i environments/local initdb.yml
$ ansible-playbook -i environments/local wipe.yml
$ ansible-playbook -i environments/local apigateway.yml
$ ansible-playbook -i environments/local openwhisk.yml
$ ansible-playbook -i environments/local postdeploy.yml
```

Normally, the ansible scripts will be executed without error. One known issue we have can be found at [this link](https://github.com/apache/incubator-openwhisk/issues/3804), you
can try to run the script "ansible-playbook -i environments/local routemgmt.yml" to see if it can succeed. If you fail to
deploy OpenWhisk, please [log an issue](https://github.com/apache/incubator-openwhisk/issues) for OpenWhisk community.


## Run OpenWhisk

The easiest way to try out OpenWhisk is to use OpenWhisk CLI. Please find the configuration [here](https://github.com/apache/incubator-openwhisk/blob/master/docs/cli.md).
For example, you can configure you CLI with the following command, if you have deployed OpenWhisk locally:

```
$ wsk property set --apihost 172.17.0.1 --auth $(cat ${OPENWHISK_HOME}/ansible/files/auth.guest)
```

The environment variable $OPENWHISK_HOME points to the directory incubator-openwhisk. After that, run the following command
to each an input message:

```
$ bin/wsk -i action invoke /whisk.system/utils/echo -p message hello --result
```

Output:

```
{
    "message": "hello"
}
```

If you can get the above message, you have successfully deployed OpenWhisk on your local machine.

If you want to learn how to use OpenWhisk in a more comprehensive way, please visit the [OpenWhisk website](https://openwhisk.apache.org/) or
[OpenWhisk repository](https://github.com/apache/incubator-openwhisk/blob/master/README.md) for detailed information.
