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

# Assembling a LICENSE file

## How to assemble the LICENSE file for an Apache OpenWhisk repository

This document describes how to assemble the LICENSE file for an Apache OpenWhisk repository in compliance with Apache policy.

## LICENSE file structure

The LICENSE file consists of two major sections:

- The content of Apache license 2.0
- 3rd party License dependency listing (copy 3rd party license and reference)
    - Qualified by "bundled" or "unbundled"

### Copy and adjust the Apache 2 License text

The content of the first section can be copied from the link [Apache license 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

If applicable replace the sentence "Copyright [yyyy] [name of copyright owner]" with "Copyright 2016-<present> The Apache Software Foundation".

### Note and reference 3rd party licenses

The second section includes the information of licenses used by other software, since OpenWhisk depends on multiple packages in different ways. Please apply the following rules to identify and describe the relationship between them and OpenWhisk.

A folder named licenses needs to be created under the home directory of each OpenWhisk project in order to keep the license files of other packages, each OpenWhisk project depends on. Make sure the license file is named after LICENSE-[package name].txt for each package.

So far, we list 4 types of relations available among all OpenWhisk projects. We tend to group the packages by licenses, which means packages can be listed under one statement, if they share the same license.

- **Source code dependency**: the packages, that OpenWhisk's source code depends on, and will be released together with OpenWhisk projects.

  For this type of dependency, we used the verb "bundle" to indicate the relationship and add the following narration to LICENSE file to describe it:

      This distribution bundles the following components, which are available under a [license name] license ([link of the licese]).
      [package name] [version] ([codename] - [link of the package])
        License included at licenses/LICENSE-[package name].txt
        [copyright information]

      [package name] [version] ([codename] - [link of the package])
        License included at licenses/LICENSE-[package name].txt
        [copyright information]
      ...

- **Binary dependency**: the packages, that OpenWhisk's source code depends on, but will NOT be released together with OpenWhisk projects.

  For this type of dependency, we use the phrase "have binary dependencies on" to indicate the relationship and add the following narration to LICENSE file to describe it:

      This distribution has binary dependencies on the following components, which are available under a [license name] license ([link of the licese]).
      [package name] [version] ([codename] - [link of the package])
        License included at licenses/LICENSE-[package name].txt
        [copyright information]

      [package name] [version] ([codename] - [link of the package])
        License included at licenses/LICENSE-[package name].txt
        [copyright information]
      ...

  For example, OpenWhisk CLI has binary dependencies on go-isatty and go-homedir, which are both licensed with MIT. We are add the following narration
  into LICENSE file:

        This distribution has binary dependencies on the following components, which are available an MIT license (http://opensource.org/licenses/MIT).
        Go Isatty 66b8e73 (mattn/go-isatty - https://github.com/mattn/go-isatty)
          License included at licenses/LICENSE-goisatty.txt, or https://github.com/mattn/go-isatty/blob/master/LICENSE
          Copyright (c) Yasuhiro MATSUMOTO <mattn.jp@gmail.com>

        Go Homedir 1111e45 (mitchellh/go-homedir - https://github.com/mitchellh/go-homedir)
          License included at licenses/LICENSE-gohomedir.txt, or https://github.com/mitchellh/go-homedir/blob/master/LICENSE
          Copyright (c) 2013 Mitchell Hashimoto

  The content of their licenses are included under licenses/LICENSE-goisatty.txt and licenses/LICENSE-gohomedir.txt.

- **Packages used by OpenWhisk with no alternative**: the components, that are necessary to deliver OpenWhisk services or tools,
and currently are the only candidates used by OpenWhisk.

  For this type of dependency, we use the phrase "depend on" to indicate the relationship and add the following narration to LICENSE file to describe it:

      This distribution depends on the following components, which are available under a [license name] license ([link of the licese]).
      [package name] [version] ([codename] - [link of the package])
        License included at licenses/LICENSE-[package name].txt
        [copyright information]

      [package name] [version] ([codename] - [link of the package])
        License included at licenses/LICENSE-[package name].txt
        [copyright information]
      ...

  For example, OpenWhisk depends on Docker engine, which is licensed with Apache 2.0. We can add the following narration into LICENSE file:

        This distribution depends on the following components, which are available an Apache license 2.0 (https://www.apache.org/licenses/LICENSE-2.0).
        Docker engine [Docker version] (Docker - https://www.docker.com)
          License included at licenses/LICENSE-docker.txt
          Copyright 2013-2017 Docker, Inc

- **Packages used by OpenWhisk with alternative**: the components, that are necessary to deliver OpenWhisk services or tools,
but can be replaced with other packages by changing OpenWhisk configurations.

  For this type of dependency, we use the phrase "optionally depend on" to indicate the relationship and add the following narration to LICENSE file to describe it:

      This distribution optionally depends on the following components, which are available under a [license name] license ([link of the licese]).
      [package name] [version] ([codename] - [link of the package])
        License included at licenses/LICENSE-[package name].txt
        [copyright information]

      [package name] [version] ([codename] - [link of the package])
        License included at licenses/LICENSE-[package name].txt
        [copyright information]
      ...

  For example, OpenWhisk depends on Kafka and CouchDB, which are both licensed with Apache 2.0, but they can be replaced with other
  messaging and database services. We can add the following narration into LICENSE file:

        This distribution optionally depends on the following components, which are available an Apache license 2.0 (https://www.apache.org/licenses/LICENSE-2.0).
        Apache Kafka [Kafka version] (Kafka - https://github.com/apache/kafka)
          License included at licenses/LICENSE-kafka.txt
          Copyright 2018 The Apache Software Foundation

        Apache CouchDB [CouchDb version] (CouchDB - https://github.com/apache/couchdb)
          License included at licenses/LICENSE-couchdb.txt
          Copyright 2009-2016 The Apache Software Foundation

  The content of their licenses are included under licenses/LICENSE-kafka.txt and licenses/LICENSE-couchdb.txt.
