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

The following table provides a single view, with links, of all project repository LICENSE and NOTICE files. For convenience, we provide a summary of notable 3rd party and custom licenses that are included with each repository.  However, the LICENSE and NOTICE files themselves contain the full legal references.

<table border="1" cellpadding="8">
<tbody>
<tr align="left" valign="top">
<th width="310">Repository</th>
<th width="220">LICENSE Notes</th>
<th width="220">NOTICE Notes</th>
<th width="220">Work items / Issues</th>
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
<p><strong>Non-bundled</strong>:</p>
<ul>
<li>Scala libraries: BSD 3-clause "New"</li>
<li><span class="blob-code-inner">PureConfig: MPL 2.0</span></li>
<li><span class="blob-code-inner">logback: Eclipse 1.0., </span><span class="blob-code-inner">GNU LPGL 2.1</span></li>
<li><span class="blob-code-inner">jcl-over-slf4j: MIT</span></li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/75">#75</a></p>
</td>
<td>
<ul>
<li>ASF Licenses: <a class="external-link" href="https://github.com/apache/incubator-openwhisk/issues/3264" rel="nofollow">PR#3264</a> (246 files), need to identify which can be excluded.</li>
<li><strong>LICENSE: </strong><a href="https://github.com/apache/incubator-openwhisk/pull/3550">PR3550</a></li>
<li><strong>Issue: </strong><a href="https://github.com/apache/incubator-openwhisk-release/issues/122">#122</a> (logback)</li>
<li><strong>ScanCode</strong>: Need to use ASF-Release.cfg</li>
<li><strong>GitHub</strong>: "openwhisk" missing as Topic.</li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-catalog">incubator-openwhisk-catalog</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-catalog/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/96">#96</a></p>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-catalog/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/79">#79</a></p>
</td>
<td align="left">
<ul>
<li><strong>ASF Licenses</strong>: <a class="external-link" href="https://github.com/apache/incubator-openwhisk-catalog/issues/256" rel="nofollow">PR256</a> (19 files), need to identify which can be excluded.</li>
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
<p><strong>Exclusions</strong>:</p>
<ul>
<li>lua_install</li>
<li>tests/lua_modules</li>
</ul>
<p><strong>Known Exceptions</strong>:</p>
<ul>
<li>LUA License is an MIT derivative. It requires us to acknowledge copyright.</li>
</ul>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-apigateway/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/78">#78</a></p>
</td>
<td>
<ul>
<li><strong>Private Adobe/MIT license: </strong></li>
<li>Issue: <a href="https://github.com/apache/incubator-openwhisk-release/issues/108">#108</a> (release)</li>
<li>Issue <a href="https://github.com/apache/incubator-openwhisk-apigateway/issues/288">#288</a> (apigw)</li>
<li><strong>GitHub</strong>: No description in GitHub</li>
<li><strong>GitHub</strong>: No "openwhisk" topic in GitHub</li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-cli">incubator-openwhisk-cli</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-cli/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/97">#97</a></p>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-cli/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/76">#76</a></p>
</td>
<td>
<ul>
<li><strong>ASF License</strong>: <a class="external-link" href="https://github.com/apache/incubator-openwhisk-cli/issues/222" rel="nofollow">PR222</a> (54 files)</li>
<li><strong>LICENSE</strong>: <a href="https://github.com/apache/incubator-openwhisk-cli/pull/271">PR271</a></li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-client-go">incubator-openwhisk-client-go</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-client-go/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/98">#98</a></p>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-client-go/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/77">#77</a></p>
</td>
<td>
<ul>
<li><strong>GitHub</strong>: No description in GitHub</li>
<li><strong>ASF License</strong>: <a class="external-link" href="https://github.com/apache/incubator-openwhisk-client-go/issues/68" rel="nofollow">PR68</a> (4 files)</li>
<li><strong>LICENSE</strong>: <a href="https://github.com/apache/incubator-openwhisk-client-go/pull/75">PR75</a></li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-wskdeploy">incubator-openwhisk-wskdeploy</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-wskdeploy/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/94">#94</a></p>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-wskdeploy/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/86">#86</a></p>
</td>
<td>
<ul>
<li><strong>ASF License</strong>: <a class="external-link" href="https://github.com/apache/incubator-openwhisk-wskdeploy/issues/716" rel="nofollow">PR#716</a> (5 files)</li>
<li><strong>LICENSE</strong>: <a href="https://github.com/apache/incubator-openwhisk-wskdeploy/pull/868">PR868</a></li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs">incubator-openwhisk-runtime-nodejs</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/99">#99</a></p>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/82">#82</a></p>
</td>
<td>
<ul>
<li><strong>ASF License</strong>: <a class="external-link" href="https://github.com/apache/incubator-openwhisk-runtime-nodejs/issues/25" rel="nofollow">PR#25</a> (14 files)</li>
<li><strong>LICENSE</strong>: <a href="https://github.com/apache/incubator-openwhisk-runtime-nodejs/pull/38">PR38</a></li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-swift"> incubator-openwhisk-runtime-swift</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/100">#100</a></p>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/85">#85</a></p>
</td>
<td>
<ul>
<li><strong>ASF License</strong>: <a class="external-link" href="https://github.com/apache/incubator-openwhisk-runtime-swift/issues/31" rel="nofollow">PR#31</a> (34 files)</li>
<li><strong>LICENSE</strong>: <a href="https://github.com/apache/incubator-openwhisk-runtime-swift/pull/44">PR44</a></li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-docker">incubator-openwhisk-runtime-docker</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-docker/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/101">#101</a></p>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-docker/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/80">#80</a></p>
</td>
<td>
<ul>
<li><strong>ASF License</strong>: <a class="external-link" href="https://github.com/apache/incubator-openwhisk-runtime-docker/issues/20" rel="nofollow">PR#20</a> (25 files)</li>
<li><strong>LICENSE</strong>: <a href="https://github.com/apache/incubator-openwhisk-runtime-docker/pull/28">PR28</a></li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-java">incubator-openwhisk-runtime-java</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-java/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/102">#102</a></p>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-java/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/81">#81</a></p>
</td>
<td>
<ul>
<li><strong>ASF License</strong>: <a class="external-link" href="https://github.com/apache/incubator-openwhisk-runtime-java/issues/25" rel="nofollow">PR#25</a> (12 files)</li>
<li><strong>LICENSE</strong>: <a href="https://github.com/apache/incubator-openwhisk-runtime-java/pull/32">PR32</a></li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-php">incubator-openwhisk-runtime-php</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-php/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking: </strong><a href="https://github.com/apache/incubator-openwhisk-release/issues/103">#103</a></p>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-php/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/83">#83</a></p>
</td>
<td>
<ul>
<li><strong>ASF License</strong>: <a class="external-link" href="https://github.com/apache/incubator-openwhisk-runtime-php/issues/8" rel="nofollow">PR#8</a> (10 files)</li>
<li><strong>LICENSE</strong>: <a href="https://github.com/apache/incubator-openwhisk-runtime-php/pull/14">PR14</a></li>
</ul>
</td>
</tr>
<tr align="left" valign="top">
<td><a href="https://github.com/apache/incubator-openwhisk-runtime-python">incubator-openwhisk-runtime-python</a></td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-python/blob/master/LICENSE.txt">LICENSE</a></p>
<p><strong>Tracking</strong>:&nbsp;<a href="https://github.com/apache/incubator-openwhisk-release/issues/104">#104</a></p>
</td>
<td>
<p><a href="https://github.com/apache/incubator-openwhisk-runtime-python/blob/master/NOTICE.txt">NOTICE</a></p>
<p><strong>Tracking</strong>: <a href="https://github.com/apache/incubator-openwhisk-release/issues/84">#84</a></p>
</td>
<td>
<ul>
<li><strong>ASF License</strong>: <a class="external-link" href="https://github.com/apache/incubator-openwhisk-runtime-python/issues/10" rel="nofollow">PR#10</a> (13 files)</li>
<li><strong>LICENSE</strong>: <a href="https://github.com/apache/incubator-openwhisk-runtime-python/pull/15">PR15</a></li>
</ul>
</td>
</tr>
</tbody>
</table>

## Notes
- The general requirements and tracking of all LICENSE related update for all repos. are in [Issue 109](https://github.com/apache/incubator-openwhisk-release/issues/109).

## References

The following is a list of informative references that describe licenses that you may encounter in this project's along with their prescribed treatment by the owning entities.

- **[Mozilla, MPL 2.0 FAQ](https://www.mozilla.org/en-US/MPL/2.0/FAQ/)**
- **[Eclipse, EPL 1.0 FAQ](https://www.eclipse.org/legal/eplfaq.php)**

