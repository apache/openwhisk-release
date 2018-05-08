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

# Apache OpenWhisk LICENSE and NOTICE Summary

## License scanning exclusions

The Apache OpenWhisk project enforces and verifies ASF License header conformance on all source files using the project's own scanCode utility (on all Travis CI builds) and Apache RAT tool (on all automated releases).

In accordance with Apache policy, these utilities exclude specific files from the ASF license header requirement which are configured in the following files:
- scanCode: [ASF-Release.cfg](https://github.com/apache/incubator-openwhisk-utilities/blob/master/scancode/ASF-Release.cfg)
- Apache RAT:[pom.xml](https://github.com/apache/incubator-openwhisk-release/blob/master/tools/lib/pom.xml) (Apache Rat)

## Bundled and non-Bundled dependencies

In accordance with Apache policy, each of the Apache OpenWhisk project's repositories respective LICENSE and NOTICE files contain the full, canonical listing of all dependent software licenses.

For convenience, the following table provides links to each project repository's LICENSE and NOTICE files, as well as an overview of notable software dependencies (non-canonical) and license scanning exclusions.

<table border="1" cellpadding="8">
<tbody>
<tr align="left" valign="top">
<th width="310">Repository</th>
<th width="220">LICENSE Notes</th>
<th width="220">NOTICE Notes</th>
<th width="220">ASF Header Exclusions</th>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk">incubator-openwhisk</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/93">#93</a></p>
<p><strong>Copied licenses</strong>:</p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk/tree/master/licenses">licenses</a></li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/75">#75</a></p>
</td>
<td>
<ul>
<li>tests/dat/actions/empty.js</li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-catalog">incubator-openwhisk-catalog</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-catalog/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/96">#96</a></p>
<p><strong>Copied licenses</strong>:</p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-catalog/tree/master/licenses">licenses</a></li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-catalog/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/79">#79</a></p>
</td>
<td>
<ul>
<li><span style="color: #ff0000;">None ?</span></li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-apigateway">incubator-openwhisk-apigateway</a></p>
<p>&nbsp;</p>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-apigateway/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/95">#95</a></p>
<p><strong>Copied licenses:</strong></p>
<ul>
<li><span style="color: #ff0000;">TBD</span></li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-apigateway/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/78">#78</a></p>
</td>
<td>
<ul>
<li>lua_install</li>
<li>tests/lua_modules</li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-cli">incubator-openwhisk-cli</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-cli/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/97">#97</a></p>
<p><strong>Copied</strong> <strong>Licenses</strong>:</p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-cli/tree/master/licenses">licenses</a></li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-cli/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/76">#76</a></p>
</td>
<td>
<ul>
<li><span style="color: #ff0000;">tests files ?</span></li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-client-go">incubator-openwhisk-client-go</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-client-go/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/98">#98</a></p>
<p>Copied Licenses:</p>
<ul>
<li><span style="color: #ff0000;">TBD</span></li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-client-go/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/77">#77</a></p>
</td>
<td>
<ul>
<li><span style="color: #ff0000;">TBD</span></li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-wskdeploy">incubator-openwhisk-wskdeploy</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-wskdeploy/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/94">#94</a></p>
<p><strong>Copied licenses</strong>:</p>
<ul>
<li><span style="color: #ff0000;">TBD</span></li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-wskdeploy/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/86">#86</a></p>
</td>
<td>
<ul>
<li><span style="color: #ff0000;">TBD</span></li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs">incubator-openwhisk-runtime-nodejs</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/99">#99</a></p>
<p><strong>Copied licenses</strong>:</p>
<ul>
<li><span style="color: #ff0000;">TBD</span></li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/82">#82</a></p>
</td>
<td>
<ul>
<li>tests/src/test/resources/application.conf</li>
<li>ansible/environments/local/group_vars/all</li>
<li>ansible/environments/local/hosts</li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-swift"> incubator-openwhisk-runtime-swift</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/100">#100</a></p>
<p><strong>Copied licenses</strong>:</p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-swift/tree/master/license">license *</a></li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/85">#85</a></p>
</td>
<td>
<ul>
<li>tests/dat/actions/SwiftyRequest/Package.resolved</li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-docker">incubator-openwhisk-runtime-docker</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-docker/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/101">#101</a></p>
<p><strong>Copied licenses</strong>:</p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-docker/tree/master/licenses">licenses</a></li>
</ul>
<p>&nbsp;</p>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-docker/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/80">#80</a></p>
</td>
<td>
<ul>
<li>tests/src/test/resources/application.conf</li>
<li>ansible/environments/local/group_vars/all</li>
<li>ansible/environments/local/hosts</li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-java">incubator-openwhisk-runtime-java</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-java/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/102">#102</a></p>
<p><strong>Copied licenses</strong>:</p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-java/tree/master/licenses">licenses</a></li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-java/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/81">#81</a></p>
</td>
<td>
<ul>
<li>tests/src/test/resources/application.conf</li>
<li>ansible/environments/local/group_vars/all</li>
<li>ansible/environments/local/hosts</li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-php">incubator-openwhisk-runtime-php</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-php/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking: </strong><a href="https://github.com/apache/incubator-openwhisk-release/issues/103">#103</a></p>
<p><strong>Copied licenses</strong>:</p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-php/tree/master/licenses">licenses</a></li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-php/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/83">#83</a></p>
</td>
<td>&nbsp;
<ul>
<li>tests/src/test/resources/application.conf</li>
<li>ansible/environments/local/group_vars/all</li>
<li>ansible/environments/local/hosts</li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-python">incubator-openwhisk-runtime-python</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-python/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>:&nbsp;<a href="https://github.com/apache/incubator-openwhisk-release/issues/104">#104</a></p>
<p><strong>Copied licenses</strong>:</p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-python/tree/master/licenses">licenses</a></li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-python/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/84">#84</a></p>
</td>
<td>&nbsp;
<ul>
<li>tests/src/test/resources/application.conf</li>
<li>ansible/environments/local/group_vars/all</li>
<li>ansible/environments/local/hosts</li>
</ul>
</td>
</tr>
</tbody>
</table>

## Notes
- The general requirements and tracking of all LICENSE related update for all repos. are in [Issue 109](https://github.com/apache/incubator-openwhisk-release/issues/109).

## How to assemble the LICENSE file for each OpenWhisk repository

We define a formal way for OpenWhisk projects to comply in order to produce the LICENSE files. Please follow the mechanism
of syntax and wording narrated in the following paragraphs.

The LICENSE file consists of two major sections:

- The content of Apache license 2.0
- Licenses of packages OpenWhisk project depends on

The content of the first section can be copied from the link [Apache license 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).
We can keep it in OpenWhisk exactly the same as its original content, or replace the sentence "Copyright [yyyy] [name of copyright owner]"
with "Copyright 2016-present The Apache Software Foundation", which describes the copyright of OpenWhisk.

The second section includes the information of licenses used by other software, since OpenWhisk depends on multiple packages
in different ways. Please apply the following rules to identify and describe the relationship between them and OpenWhisk.

A folder named licenses needs to be created under the home directory of each OpenWhisk project in order to keep the license files
of other packages, each OpenWhisk project depends on. Make sure the license file is named after LICENSE-[package name].txt for each
package.

So far, we list 4 types of relations available among all OpenWhisk projects. We tend to group the packages by licenses, which
means packages can be listed under one statement, if they share the same license.

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

## References

The following is a list of informative references that describe licenses that you may encounter in this project's along with their prescribed treatment by the owning entities.

- **[Mozilla, MPL 2.0 FAQ](https://www.mozilla.org/en-US/MPL/2.0/FAQ/)**
- **[Eclipse, EPL 1.0 FAQ](https://www.eclipse.org/legal/eplfaq.php)**
