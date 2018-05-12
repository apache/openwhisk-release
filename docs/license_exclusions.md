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

# Known exclusions

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
<th width="250">Repository</th>
<th width="320">Exclusion</th>
<th width="220">Rationale</th>
</tr>
<!-- ====== openwhisk ===================================================  -->
<tr align="left" valign="top">
<td>
<p><a href="https://github.com/apache/incubator-openwhisk">incubator-openwhisk</a></p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk/blob/master/LICENSE.txt">LICENSE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/93">#93</a>)</li>
<li><a href="https://github.com/apache/incubator-openwhisk/blob/master/NOTICE.txt">NOTICE (</a><a href="https://github.com/apache/incubator-openwhisk-release/issues/75">#75</a><a href="https://github.com/apache/incubator-openwhisk/blob/master/NOTICE.txt">)</a></li>
</ul>
</td>
<td>
<p>tests/dat/actions/empty.js</p>
</td>
<td>&nbsp;</td>
</tr>
<!-- ====== openwhis-catalog ===============================================  -->
<tr align="left" valign="top">
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-catalog">incubator-openwhisk-catalog</a></p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-catalog/blob/master/LICENSE.txt">LICENSE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/96">#96</a>)</li>
<li><a href="https://github.com/apache/incubator-openwhisk-catalog/blob/master/NOTICE.txt">NOTICE </a>(<a href="https://github.com/apache/incubator-openwhisk-release/issues/79">#79</a>)</li>
</ul>
</td>
<td>
<p><span style="color: #ff0000;">None ?</span></p>
</td>
<td>&nbsp;</td>
</tr>
<!-- ====== openwhisk-apigateway ===============================================  -->
<tr align="left" valign="top">
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-apigateway">incubator-openwhisk-apigateway</a></p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-apigateway/blob/master/LICENSE.txt">LICENSE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/95">#95</a>)</li>
<li><a href="https://github.com/apache/incubator-openwhisk-apigateway/blob/master/NOTICE.txt">NOTICE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/78">#78</a>)</li>
</ul>
</td>
<td>
<p>lua_install</p>
</td>
<td>&nbsp;</td>
</tr>
<tr align="left" valign="top">
<td>&nbsp;</td>
<td>tests/lua_modules</td>
<td>&nbsp;</td>
</tr>
<!-- ====== openwhisk-cli ===============================================  -->
<tr align="left" valign="top">
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-cli">incubator-openwhisk-cli</a></p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-cli/blob/master/LICENSE.txt">LICENSE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/97">#97</a>)</li>
<li><a href="https://github.com/apache/incubator-openwhisk-cli/blob/master/NOTICE.txt">NOTICE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/76">#76</a>)</li>
</ul>
</td>
<td>
<p><span style="color: #ff0000;">tests files ?</span></p>
</td>
<td>&nbsp;</td>
</tr>
<!-- ====== openwhisk-client-go ===============================================  -->
<tr align="left" valign="top">
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-client-go">incubator-openwhisk-client-go</a></p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-client-go/blob/master/LICENSE.txt">LICENSE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/98">#98</a>)</li>
<li><a href="https://github.com/apache/incubator-openwhisk-client-go/blob/master/NOTICE.txt">NOTICE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/77">#77</a>)</li>
</ul>
</td>
<td>
<p><span style="color: #ff0000;">TBD</span></p>
</td>
<td>&nbsp;</td>
</tr>
<!-- ====== openwhisk-wskdeploy ===============================================  -->
<tr align="left" valign="top">
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-wskdeploy">incubator-openwhisk-wskdeploy</a></p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-wskdeploy/blob/master/LICENSE.txt">LICENSE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/94">#94</a>)</li>
<li><a href="https://github.com/apache/incubator-openwhisk-wskdeploy/blob/master/NOTICE.txt">NOTICE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/86">#86</a>)</li>
</ul>
</td>
<td>
<p><span style="color: #ff0000;">TBD</span></p>
</td>
<td>&nbsp;</td>
</tr>
<!-- ====== openwhisk-runtime-nodejs ===============================================  -->
<tr align="left" valign="top">
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs">incubator-openwhisk-runtime-nodejs</a></p>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/LICENSE.txt">LICENSE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/99">#99</a>)</li>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/NOTICE.txt">NOTICE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/82">#82</a>)</li>
</ul>
</td>
<td>
<p>tests/src/test/resources/application.conf</p>
</td>
<td>&nbsp;</td>
</tr>
<tr align="left" valign="top">
<td>&nbsp;</td>
<td>ansible/environments/local/group_vars/all</td>
<td>&nbsp;</td>
</tr>
<tr align="left" valign="top">
<td>&nbsp;</td>
<td>ansible/environments/local/hosts</td>
<td>&nbsp;</td>
</tr>
<!-- ====== openwhisk-runtime-swift ===============================================  -->
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-swift"> incubator-openwhisk-runtime-swift</a>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/LICENSE.txt">LICENSE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/100">#100</a>)</li>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/NOTICE.txt">NOTICE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/85">#85</a>)</li>
</ul>
</td>
<td>
<p>tests/dat/actions/SwiftyRequest/Package.resolved</p>
</td>
<td>&nbsp;</td>
</tr>
<!-- ====== openwhisk-runtime-docker ===============================================  -->
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-docker">incubator-openwhisk-runtime-docker</a>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-docker/blob/master/LICENSE.txt">LICENSE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/101">#101</a>)</li>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-docker/blob/master/NOTICE.txt">NOTICE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/80">#80</a>)</li>
</ul>
</td>
<td>
<p>tests/src/test/resources/application.conf</p>
</td>
<td>&nbsp;</td>
</tr>
<tr align="left" valign="top">
<td>&nbsp;</td>
<td>ansible/environments/local/group_vars/all</td>
<td>&nbsp;</td>
</tr>
<tr align="left" valign="top">
<td>&nbsp;</td>
<td>ansible/environments/local/hosts</td>
<td>&nbsp;</td>
</tr>
<!-- ====== openwhisk-runtime-java ===============================================  -->
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-java">incubator-openwhisk-runtime-java</a>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-java/blob/master/LICENSE.txt">LICENSE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/102">#102</a>)</li>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-java/blob/master/NOTICE.txt">NOTICE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/81">#81</a>)</li>
</ul>
</td>
<td>
<p>tests/src/test/resources/application.conf</p>
</td>
<td>&nbsp;</td>
</tr>
<tr align="left" valign="top">
<td>&nbsp;</td>
<td>ansible/environments/local/group_vars/all</td>
<td>&nbsp;</td>
</tr>
<tr align="left" valign="top">
<td>&nbsp;</td>
<td>ansible/environments/local/hosts</td>
<td>&nbsp;</td>
</tr>
<!-- ====== openwhisk-runtime-php ===============================================  -->
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-php">incubator-openwhisk-runtime-php</a>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-php/blob/master/LICENSE.txt">LICENSE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/103">#103</a>)</li>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-php/blob/master/NOTICE.txt">NOTICE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/83">#83</a>)</li>
</ul>
</td>
<td>
<p>tests/src/test/resources/application.conf</p>
</td>
<td>&nbsp;</td>
</tr>
<tr align="left" valign="top">
<td>&nbsp;</td>
<td>ansible/environments/local/group_vars/all</td>
<td>&nbsp;</td>
</tr>
<tr align="left" valign="top">
<td>&nbsp;</td>
<td>ansible/environments/local/hosts</td>
<td>&nbsp;</td>
</tr>
<!-- ====== openwhisk-runtime-python ===============================================  -->
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-python">incubator-openwhisk-runtime-python</a>
<ul>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-python/blob/master/LICENSE.txt">LICENSE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/104">#104</a>)</li>
<li><a href="https://github.com/apache/incubator-openwhisk-runtime-python/blob/master/NOTICE.txt">NOTICE</a> (<a href="https://github.com/apache/incubator-openwhisk-release/issues/84">#84</a>)</li>
</ul>
</td>
<td>
<p>tests/src/test/resources/application.conf</p>
</td>
<td>&nbsp;</td>
</tr>
<tr align="left" valign="top">
<td>&nbsp;</td>
<td>ansible/environments/local/group_vars/all</td>
<td>&nbsp;</td>
</tr>
<tr align="left" valign="top">
<td>&nbsp;</td>
<td>ansible/environments/local/hosts</td>
<td>&nbsp;</td>
</tr>
</tbody>
</table>

| File (type) | Exclusion Rationale |
| --- | --- |
| `post.lua`                                               | Configuration file. Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/performance/wrk_tests/post.lua) |
| `java.xml`,`logback.xml`                                 | Configuration file in XML format. Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/tools/eclipse/java.xml) |
| `group_vars/all`                                         | Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/ansible/environments/local/group_vars/all) |
| `hosts`                                                  | Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/ansible/environments/local/hosts) |
| `dockerhub.groovy`                                       | Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/tools/jenkins/apache/dockerhub.groovy) |
| `openwhisk/actionRuntimes/*/Dockerfile`                  | Simple docker file without creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/actionRuntimes/python2Action/Dockerfile) |
| `openwhisk/sdk/docker/Dockerfile`                        | Simple docker file without creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/sdk/docker/Dockerfile) |
| `openwhisk/tests/dat/apigw/testswaggerdoc*`                        | JSON files as test input data. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/tests/dat/apigw/testswaggerdoc2) |
| `openwhisk/tests/dat/actions/empty.js`                        | Empty file. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/tests/dat/actions/empty.js) |
| `SwiftyRequest/Package.resolved`                        | Configuration used by Swift Package Manager. See a sample [here](https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/tests/dat/actions/SwiftyRequest/Package.resolved) |
| `gradlew.bat` and `gradlew`                     | Generated by Gradle wrapper. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/gradlew.bat) |


## References

The following is a list of informative references that describe licenses that you may encounter in this project's along with their prescribed treatment by the owning entities.

- **[Mozilla, MPL 2.0 FAQ](https://www.mozilla.org/en-US/MPL/2.0/FAQ/)**
- **[Eclipse, EPL 1.0 FAQ](https://www.eclipse.org/legal/eplfaq.php)**
