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

# ASF License header exception tracking

For convenience, the following table provides links to each project repository's LICENSE and NOTICE files, as well as an overview of notable software dependencies (non-canonical) and license scanning exclusions.

**NOTE: This listing is not intended to be complete or canonical**

### [incubator-openwhisk](https://github.com/apache/incubator-openwhisk)

| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/ansible.cfg]() | ANS.CFG |
| [ansible/environments/distributed/files/openstack/openstack.env](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/distributed/files/openstack/openstack.env) | ANS.ENV |
| [ansible/environments/distributed/hosts](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/distributed/hosts) | ANS.HOSTS |
| [ansible/environments/docker-machine/hosts.j2.ini](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/docker-machine/hosts.j2.ini) | ANS.INI |
| [ansible/environments/local/hosts.j2.ini](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/local/hosts.j2.ini) | ANS.INI |
| [ansible/environments/vagrant/hosts](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/vagrant/hosts) | ANS.HOSTS |
| [ansible/files/activations_design_document_for_activations_db.json]() | JSON |
| [ansible/files/auth.guest]() | DATA.AUTH |
| [ansible/files/auth.whisk.system]() |  DATA.AUTH |
| [ansible/files/auth_index.json]() | JSON |
| [ansible/files/filter_design_document.json]() | JSON |
| [ansible/files/logCleanup_design_document_for_activations_db.json]() | JSON |
| [ansible/files/namespace_throttlings_design_document_for_subjects_db.json]() | JSON |
| [ansible/files/package-versions.ini]() |  ANS.INI |
| [ansible/files/runtimes.json]() | JSON |
| [ansible/files/whisks_design_document_for_activations_db_filters_v2.1.0.json]() | JSON |
| [ansible/files/whisks_design_document_for_activations_db_v2.1.0.json]() | JSON |
| [ansible/files/whisks_design_document_for_entities_db_v2.1.0.json]() | JSON |
| [ansible/roles/docker/templates/docker.j2]() | J2 |
| [ansible/roles/nginx/files/openwhisk-server-key.pem]() | PEM |
| [ansible/roles/nginx/templates/nginx.conf.j2]() | J2 |
| [ansible/roles/registry/templates/recycle-registry.py.j2]() | J2 |
| [ansible/templates/db_local.ini.j2]() | J2 |
| [ansible/templates/jmxremote.access.j2]() | J2 |
| [ansible/templates/jmxremote.password.j2]() | J2 |
| [ansible/templates/whisk.properties.j2]() | J2 |
| [bin/wskadmin](https://github.com/apache/incubator-openwhisk/blob/master/bin/wskadmin) | Generated, symbolic link |
| [bin/wskdev](https://github.com/apache/incubator-openwhisk/blob/master/bin/wskdev) | Generated, symbolic link |
| [common/scala/src/main/resources/logback.xml](https://github.com/apache/incubator-openwhisk/blob/master/common/scala/src/main/resources/logback.xml) | XML |
| [gradle/wrapper/gradle-wrapper.jar](https://github.com/apache/incubator-openwhisk/blob/master/gradle/wrapper/gradle-wrapper.jar) | TEST.JAR |
| [gradlew.bat](https://github.com/apache/incubator-openwhisk/blob/master/gradlew.bat) | GRDL.1 |
| [gradlew](https://github.com/apache/incubator-openwhisk/blob/master/gradlew) | GRDL.3 |
| [incubator-openwhisk/docs/images/OpenWhisk_flow_of_processing.draw.io.xml](https://github.com/apache/incubator-openwhisk/blob/master/docs/images/OpenWhisk_flow_of_processing.draw.io.xml) | XML |
| [tools/eclipse/java.xml](https://github.com/apache/incubator-openwhisk/blob/master/tools/eclipse/java.xml) | XML |

### [incubator-openwhisk-apigateway](https://github.com/apache/incubator-openwhisk-apigateway)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [tests/scripts/lua/management/examples](https://github.com/apache/incubator-openwhisk-apigateway/tree/master/tests/scripts/lua/management/examples) | JSON |

### [incubator-openwhisk-catalog](https://github.com/apache/incubator-openwhisk-catalog)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [credentials.json.enc](https://github.com/apache/incubator-openwhisk-catalog/blob/master/credentials.json.enc) | **TBD** |
| [gradle/wrapper/gradle-wrapper.jar](https://github.com/apache/incubator-openwhisk-catalog/blob/master/gradle/wrapper/gradle-wrapper.jar) | **TBD** |

### [incubator-openwhisk-cli](https://github.com/apache/incubator-openwhisk-cli)
| Exclusion | Rationale [TAG] |
|:---|:---|
| _None_ | **_test files?_** |

### [incubator-openwhisk-client-go](https://github.com/apache/incubator-openwhisk-client-go)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [wski18n/i18n_resources.go](https://github.com/apache/incubator-openwhisk-client-go/blob/master/wski18n/i18n_resources.go) | I18N.1, NOTE: ASF Header manually added after autogen. recently |
| [wski18n/resources](https://github.com/apache/incubator-openwhisk-client-go/tree/master/wski18n/resources) | JSON, Empty files (i.e., no translations yet) |

### [incubator-openwhisk-runtime-docker](https://github.com/apache/incubator-openwhisk-runtime-docker)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/environments/local/hosts](https://github.com/apache/incubator-openwhisk-runtime-docker/blob/master/ansible/environments/local/hosts) | ANS.HOSTS |

### [incubator-openwhisk-runtime-java](https://github.com/apache/incubator-openwhisk-runtime-java)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/environments/local/hosts](https://github.com/apache/incubator-openwhisk-runtime-java/blob/master/ansible/environments/local/hosts) | ANS.HOSTS |

### [incubator-openwhisk-runtime-nodejs](https://github.com/apache/incubator-openwhisk-runtime-nodejs)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/environments/local/hosts](https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/ansible/environments/local/hosts) | ANS.HOSTS |

### [incubator-openwhisk-runtime-php](https://github.com/apache/incubator-openwhisk-runtime-php)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/environments/local/hosts](https://github.com/apache/incubator-openwhisk-runtime-php/blob/master/ansible/environments/local/hosts) | ANS.HOSTS |

### [incubator-openwhisk-runtime-python](https://github.com/apache/incubator-openwhisk-runtime-python)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/environments/local/hosts](https://github.com/apache/incubator-openwhisk-runtime-python/blob/master/ansible/environments/local/hosts) | ANS.HOSTS |

### [incubator-openwhisk-runtime-swift](https://github.com/apache/incubator-openwhisk-runtime-swift)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/environments/local/hosts](https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/ansible/environments/local/hosts) | ANS.HOSTS |
| [SwiftyRequest/Package.resolved](https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/tests/dat/actions/SwiftyRequest/Package.resolved) | OAPI |

### [incubator-openwhisk-wskdeploy](https://github.com/apache/incubator-openwhisk-wskdeploy)

| Exclusion | Rationale [TAG] |
|:---|:---|
| [wski18n/i18n_resources.go](https://github.com/apache/incubator-openwhisk-wskdeploy/blob/master/wski18n/i18n_resources.go) | I18N.1 |
| [wski18n/resources](https://github.com/apache/incubator-openwhisk-wskdeploy/tree/master/wski18n/resources) | JSON, Empty files (i.e., no translations yet) |
| Godeps/Godeps.json | GODEPS.1 |
| Godeps/Readme | GODEPS.2 |
| ansible/environments/local/hosts | ANS.HOSTS |
| **gradle/wrapper/gradle-wrapper.jar** | **TBD** |
| gradlew | GRDL.3 |
| gradlew.bat | GRDL.1 |
| specification/archive/*.pdf | **TBD**, e.g., specification/archive/openwhisk_v0.8.1.pdf |
| specification/diagrams/*.jpg | ve.g., specification/diagrams/OW-Programming-Model-Slides-Slide1.jpg |
| specification/diagrams/*.pptx | **TBD**, e.g., OW-Programming-Model-Slides.pptx |
| specification/*.pdf | **TBD**, e.g., specification/openwhisk_v0.9.1.pdf |
| tests/apps/owbp-cloudant-trigger/manifest-bp.json | JSON |
| tests/dat/wskprops | API Client configuration data. |
| tests/src/integration/docker/actions/exec.zip | TEST.ZIP |
| tests/src/integration/docker/actions/go/exec | TEST.ZIP, renamed from exec.zip |
| tests/src/integration/helloworld/actions/hello.jar | TEST.JAR |
| tests/src/integration/jaraction/src/hello.jar | TEST.JAR |
| tests/src/integration/message-hub/src/events.json | JSON |
| tests/src/integration/runtimetests/src/hello.jar | TEST.JAR |
| tests/src/integration/runtimetests/src/helloworld/helloworld.zip | TEST.ZIP |
| tests/src/integration/runtimetests/src/helloworld/node_modules/string-format/package.json | JSON |
| tests/src/integration/runtimetests/src/helloworld/package.json | JSON |
| tests/src/integration/validate-packages-in-manifest/actions/hello.jar | TEST.JAR |
| tests/src/integration/zipaction/actions/cat/node_modules/cat/package.json | JSON |
| tests/src/integration/zipaction/actions/cat/package.json | JSON |
| tests/apps/owbp-cloudant-trigger/manifest-bp.json | JSON |

## Test files excluded from source release
<!--
 ======= Test file exclusions NOT part of Source code releases (yet) =========
-->
The following "tests" files are excluded from having ASF License headers, but alse are NOT part of the project source code release archive when created.

### [incubator-openwhisk](https://github.com/apache/incubator-openwhisk)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [tests/credentials.json.enc](https://github.com/apache/incubator-openwhisk-catalog/blob/master/tests/credentials.json.enc) | **TBD** |
| [tests/dat/actions/blackbox.zip]() | TEST.ZIP |
| [tests/dat/actions/empty.js](https://github.com/apache/incubator-openwhisk/blob/master/tests/dat/actions/empty.js) | DATA.TEST, Empty (zero-length) test data file. |
| [tests/dat/actions/helloJava.jar]() | TEST.JAR |
| [tests/dat/actions/helloJavaDefaultPackage.jar]() | TEST.JAR |
| [tests/dat/actions/helloSwift311.zip]() | TEST.ZIP |
| [tests/dat/actions/multiSwift.zip]() | TEST.ZIP |
| [tests/dat/actions/python.zip]() | TEST.ZIP |
| [tests/dat/actions/python2_virtualenv.zip]() | TEST.ZIP |
| [tests/dat/actions/python3_virtualenv.zip]() | TEST.ZIP |
| [tests/dat/actions/python_virtualenv_dir.zip]() | TEST.ZIP |
| [tests/dat/actions/python_virtualenv_name.zip]() | TEST.ZIP |
| [tests/dat/actions/seq_echo_word_count.json]() | JSON |
| [tests/dat/actions/seq_type_2.json]() | JSON |
| [tests/dat/actions/sleep.jar]() | TEST.JAR |
| [tests/dat/actions/unicode.jar]() | TEST.JAR |
| [tests/dat/actions/validInput1.json]() | JSON |
| [tests/dat/actions/validInput2.json]() | JSON |
| [tests/dat/actions/word_count.json]() | JSON |
| [tests/dat/actions/zippedaction.zip]() | TEST.ZIP |
| [tests/dat/actions/unicode/build.gradle]() | Fixed by PR[#3702](https://github.com/apache/incubator-openwhisk/pull/3702/files) |
| [tests/dat/apigw/apigw_path_param_support_test_invalidActionType.json]() | JSON |
| [tests/dat/apigw/apigw_path_param_support_test_invalidParamName1.json]() | JSON |
| [tests/dat/apigw/apigw_path_param_support_test_invalidParamName2.json]() | JSON |
| [tests/dat/apigw/apigw_path_param_support_test_invalidTargetUrl.json]() | JSON |
| [tests/dat/apigw/apigw_path_param_support_test_withPathParameters1.json]() | JSON |
| [tests/dat/apigw/apigw_path_param_support_test_withPathParameters2.json]() | JSON |
| [tests/dat/apigw/endpoints.without.action.swagger.json]() | JSON |
| [tests/dat/apigw/testswaggerdoc1]() | OAPI. Test data. |
| [tests/dat/apigw/testswaggerdoc2]() | OAPI. Test data. |
| [tests/dat/apigw/testswaggerdocinvalid]() | OAPI. Test data. |
| [tests/performance/gatling_tests/src/gatling/resources/conf/logback.xml]() | XML |
| [tests/performance/gatling_tests/src/gatling/resources/data/javaAction.jar](https://github.com/apache/incubator-openwhisk/blob/master/tests/performance/gatling_tests/src/gatling/resources/data/javaAction.jar) | TEST.JAR |
| [tests/performance/gatling_tests/src/gatling/resources/conf/logback.xml](https://github.com/apache/incubator-openwhisk/blob/master/tests/performance/gatling_tests/src/gatling/resources/conf/logback.xml) | XML |
| [tests/performance/wrk_tests/post.lua](https://github.com/apache/incubator-openwhisk/blob/master/tests/performance/wrk_tests/post.lua) | DATA.TEXT, Empy (HTTP POST) Performance test data file. |
| [tests/src/test/resources/logback-test.xml]() | XML |

### Notes
- Apparently, logback (logger) does not support comments in their XML config. files.  We had to revert PR[#3702](https://github.com/apache/incubator-openwhisk/pull/3702/files).  This needs to be investigated as to why it failed in PG.
