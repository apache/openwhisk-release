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

# ASF License Header Known Exclusions

For convenience, the following tables provide listings of each project repository's files that have been excluded from having Apache license headers and from license scanning utilities that are part of the release process.

In addition, the specific rationale for the exclusion, in accordance with Apache release policies, is indicated as well. Rationales that are indicated by a TAG are fully described on the [license_compliance.md](license_compliance.md) page.

**NOTE: This listings are not intended to be complete or canonical**

## Exclusions part of Apache source code release

### [openwhisk](https://github.com/apache/openwhisk)

| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/ansible.cfg]() | ANS.CFG |
| [ansible/environments/distributed/files/openstack/openstack.env](https://github.com/apache/openwhisk/blob/master/ansible/environments/distributed/files/openstack/openstack.env) | ANS.ENV |
| [ansible/environments/distributed/hosts](https://github.com/apache/openwhisk/blob/master/ansible/environments/distributed/hosts) | ANS.HOSTS |
| [ansible/environments/docker-machine/hosts.j2.ini](https://github.com/apache/openwhisk/blob/master/ansible/environments/docker-machine/hosts.j2.ini) | ANS.INI |
| [ansible/environments/local/hosts.j2.ini](https://github.com/apache/openwhisk/blob/master/ansible/environments/local/hosts.j2.ini) | ANS.INI |
| [ansible/environments/vagrant/hosts](https://github.com/apache/openwhisk/blob/master/ansible/environments/vagrant/hosts) | ANS.HOSTS |
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
| [bin/wskadmin](https://github.com/apache/openwhisk/blob/master/bin/wskadmin) | Generated, symbolic link |
| [bin/wskdev](https://github.com/apache/openwhisk/blob/master/bin/wskdev) | Generated, symbolic link |
| [common/scala/src/main/resources/logback.xml](https://github.com/apache/openwhisk/blob/master/common/scala/src/main/resources/logback.xml) | XML |
| [docs/images/OpenWhisk_flow_of_processing.draw.io.xml](https://github.com/apache/openwhisk/blob/master/docs/images/OpenWhisk_flow_of_processing.draw.io.xml) | XML |
| [tools/eclipse/java.xml](https://github.com/apache/openwhisk/blob/master/tools/eclipse/java.xml) | XML |

### [openwhisk-apigateway](https://github.com/apache/openwhisk-apigateway)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [.profiling.after](https://github.com/apache/openwhisk-apigateway/blob/master/.profiling.after) | PROFILE |
| [.profiling.before](https://github.com/apache/openwhisk-apigateway/blob/master/.profiling.before) | PROFILE |

### [openwhisk-catalog](https://github.com/apache/openwhisk-catalog)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [credentials.json.enc](https://github.com/apache/openwhisk-catalog/blob/master/credentials.json.enc) | API.ENC |

### [openwhisk-client-go](https://github.com/apache/openwhisk-client-go)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [Godeps/Godeps.json](https://github.com/apache/openwhisk-client-go/blob/master/Godeps/Godeps.json) | GODEPS.JSON |
| [Godeps/Readme](https://github.com/apache/openwhisk-client-go/blob/master/Godeps/Readme) | GODEPS.README |
| [wski18n/i18n_resources.go](https://github.com/apache/openwhisk-client-go/blob/master/wski18n/i18n_resources.go) | I18N.1, NOTE: ASF Header manually added after autogen. recently |
| [wski18n/resources](https://github.com/apache/openwhisk-client-go/tree/master/wski18n/resources) | JSON, Empty files (i.e., no translations yet) |

### [openwhisk-deploy-kube](https://github.com/apache/openwhisk-deploy-kube)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [helm/runtimes.json](https://github.com/apache/openwhisk-deploy-kube/blob/master/helm/runtimes.json) | JSON |
| [runtimes-minimal-travis.json](https://github.com/apache/openwhisk-deploy-kube/blob/master/helm/runtimes-minimal-travis.json) | JSON |
| [kubernetes/controller/controller.env](https://github.com/apache/openwhisk-deploy-kube/blob/master/kubernetes/controller/controller.env) | KUBE.1 |
| [kubernetes/invoker/invoker-dcf.env](https://github.com/apache/openwhisk-deploy-kube/blob/master/kubernetes/invoker/invoker-dcf.env) | KUBE.1 |
| [kubernetes/invoker/invoker-k8scf.env](https://github.com/apache/openwhisk-deploy-kube/blob/master/kubernetes/invoker/invoker-k8scf.env) | KUBE.1 |

### [openwhisk-runtime-docker](https://github.com/apache/openwhisk-runtime-docker)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/environments/local/hosts](https://github.com/apache/openwhisk-runtime-docker/blob/master/ansible/environments/local/hosts) | ANS.HOSTS |

### [openwhisk-runtime-java](https://github.com/apache/openwhisk-runtime-java)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/environments/local/hosts](https://github.com/apache/openwhisk-runtime-java/blob/master/ansible/environments/local/hosts) | ANS.HOSTS |

### [openwhisk-runtime-nodejs](https://github.com/apache/openwhisk-runtime-nodejs)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/environments/local/hosts](https://github.com/apache/openwhisk-runtime-nodejs/blob/master/ansible/environments/local/hosts) | ANS.HOSTS |
| [core/nodejs8Action/package.json]() | JSON |
| [core/nodejsActionBase/package.json]() | JSON |

### [openwhisk-runtime-php](https://github.com/apache/openwhisk-runtime-php)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/environments/local/hosts](https://github.com/apache/openwhisk-runtime-php/blob/master/ansible/environments/local/hosts) | ANS.HOSTS |
| [core/php7.1Action/composer.json]() | JSON |

### [openwhisk-runtime-python](https://github.com/apache/openwhisk-runtime-python)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/environments/local/hosts](https://github.com/apache/openwhisk-runtime-python/blob/master/ansible/environments/local/hosts) | ANS.HOSTS |
| [core/php7.1Action/composer.json]() | JSON |

### [openwhisk-runtime-swift](https://github.com/apache/openwhisk-runtime-swift)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [ansible/environments/local/hosts](https://github.com/apache/openwhisk-runtime-swift/blob/master/ansible/environments/local/hosts) | ANS.HOSTS |

### [openwhisk-wskdeploy](https://github.com/apache/openwhisk-wskdeploy)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [wski18n/i18n_resources.go](https://github.com/apache/openwhisk-wskdeploy/blob/master/wski18n/i18n_resources.go) | I18N.1 |
| [wski18n/resources](https://github.com/apache/openwhisk-wskdeploy/tree/master/wski18n/resources) | JSON, Empty files (i.e., no translations yet) |
| [Godeps/Godeps.json]() | GODEPS.JSON |
| [Godeps/Readme]() | GODEPS.README |
| [ansible/environments/local/hosts]() | ANS.HOSTS |

## Exclusions NOT part of Apache source code release
<!--
 ======= Test file exclusions NOT part of Source code releases (yet) =========
-->
The following "tests" files are excluded from having ASF License headers, but alse are NOT part of the project source code release archive when created.

### [openwhisk](https://github.com/apache/openwhisk)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [tests/credentials.json.enc](https://github.com/apache/openwhisk-catalog/blob/master/tests/credentials.json.enc) | API.ENC |
| [tests/dat/actions/blackbox.zip]() | TEST.ZIP |
| [tests/dat/actions/empty.js](https://github.com/apache/openwhisk/blob/master/tests/dat/actions/empty.js) | DATA.TEST, Empty (zero-length) test data file. |
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
| [tests/performance/gatling_tests/src/gatling/resources/data/javaAction.jar](https://github.com/apache/openwhisk/blob/master/tests/performance/gatling_tests/src/gatling/resources/data/javaAction.jar) | TEST.JAR |
| [tests/performance/gatling_tests/src/gatling/resources/conf/logback.xml](https://github.com/apache/openwhisk/blob/master/tests/performance/gatling_tests/src/gatling/resources/conf/logback.xml) | XML |
| [tests/performance/wrk_tests/post.lua](https://github.com/apache/openwhisk/blob/master/tests/performance/wrk_tests/post.lua) | DATA.TEXT, Empy (HTTP POST) Performance test data file. |
| [tests/src/test/resources/logback-test.xml]() | XML |

### [openwhisk-apigateway](https://github.com/apache/openwhisk-apigateway)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [tests/scripts/lua/management/examples/example1.json](https://github.com/apache/openwhisk-apigateway/blob/master/tests/scripts/lua/management/examples/example1.json) | JSON |
| [tests/scripts/lua/management/examples/example2.json](https://github.com/apache/openwhisk-apigateway/blob/master/tests/scripts/lua/management/examples/example2.json) | JSON |
| [tests/scripts/lua/management/examples/example3.json](https://github.com/apache/openwhisk-apigateway/blob/master/tests/scripts/lua/management/examples/example3.json) | JSON |
| [tests/lua_modules]() | Travis installed test modules scripts. Not part of source code release. |
| [lua_install]() | Travis installed test packages. Not part of source code release. |

### [openwhisk-catalog](https://github.com/apache/openwhisk-catalog)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [tests/credentials.json.enc](https://github.com/apache/openwhisk/blob/master/tests/credentials.json.enc) | API.ENC |

### [openwhisk-cli](https://github.com/apache/openwhisk-cli)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [tests/src/dat/invalidInput1.json]() | JSON |
| [tests/src/dat/invalidInput2.json]() | JSON |
| [tests/src/dat/invalidInput3.json]() | JSON |
| [tests/src/dat/invalidInput4.json]() | JSON |

### [openwhisk-runtime-docker](https://github.com/apache/openwhisk-runtime-docker)
| Exclusion | Rationale [TAG] |
|:---|:---|
| _None_ | _N/A_ |

### [openwhisk-runtime-java](https://github.com/apache/openwhisk-runtime-java)
| Exclusion | Rationale [TAG] |
|:---|:---|
| _None_ | _N/A_ |

### [openwhisk-runtime-nodejs](https://github.com/apache/openwhisk-runtime-nodejs)
| Exclusion | Rationale [TAG] |
|:---|:---|
| _None_ | _N/A_ |

### [openwhisk-runtime-php](https://github.com/apache/openwhisk-runtime-php)
| Exclusion | Rationale [TAG] |
|:---|:---|
| _None_ | _N/A_ |

### [openwhisk-runtime-python](https://github.com/apache/openwhisk-runtime-python)
| Exclusion | Rationale [TAG] |
|:---|:---|
| _None_ | _N/A_ |

### [openwhisk-runtime-swift](https://github.com/apache/openwhisk-runtime-swift)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [tests/dat/SwiftyRequest/Package.resolved](https://github.com/apache/openwhisk-runtime-swift/blob/master/tests/dat/actions/SwiftyRequest/Package.resolved) | OAPI |

### [openwhisk-wskdeploy](https://github.com/apache/openwhisk-wskdeploy)
| Exclusion | Rationale [TAG] |
|:---|:---|
| [specification/archive/*](https://github.com/apache/openwhisk-wskdeploy/tree/master/specification/archive) | Archive of specification versions in PDF format. |
| [specification/diagrams/*](https://github.com/apache/openwhisk-wskdeploy/tree/master/specification/diagrams) | IMAGE, Ninary images (e.g., ```.jpg```, ```.png```, etc.) used in specification HTML. |
| [tests/apps/owbp-cloudant-trigger/manifest-bp.json]() | JSON |
| [tests/dat/wskprops]() | API Client configuration data. |
| [tests/dat/wskpropsnokeycert]() | API Client configuration data. |
| [tests/src/integration/docker/actions/exec.zip]() | TEST.ZIP |
| [tests/src/integration/docker/actions/go/exec]() | TEST.ZIP, renamed from exec.zip |
| [tests/src/integration/helloworld/actions/hello.jar]() | TEST.JAR |
| [tests/src/integration/jaraction/src/hello.jar]() | TEST.JAR |
| [tests/src/integration/message-hub/src/events.json]() | JSON |
| [tests/src/integration/runtimetests/src/hello.jar]() | TEST.JAR |
| [tests/src/integration/runtimetests/src/helloworld/helloworld.zip]() | TEST.ZIP |
| [tests/src/integration/runtimetests/src/helloworld/node_modules/string-format/package.json]() | JSON |
| [tests/src/integration/runtimetests/src/helloworld/package.json]() | JSON |
| [tests/src/integration/validate-packages-in-manifest/actions/hello.jar]() | TEST.JAR |
| [tests/src/integration/zipactio_actions/cat/node_modules/cat/package.json]() | JSON |
| [tests/src/integration/zipactio_actions/cat/package.json]() | JSON |
| [tests/apps/owbp-cloudant-trigger/manifest-bp.json]() | JSON |

### Notes
- logback (logger) failed in PG when adding XML comments that included the ASF license header. See PR[#3702](https://github.com/apache/openwhisk/pull/3702/files) which had to be reverted (although it passed Travis).  This needs to be investigated as to why it failed in PG and if we need additional Travis tests.
