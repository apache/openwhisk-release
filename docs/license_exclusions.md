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

This listing is not intended to be complete or canonical

| Repository | Exclusion | Rationale [TAG] |
|:---|:---|:---|
| [incubator-openwhisk](https://github.com/apache/incubator-openwhisk) | [ansible/ansible.cfg]() | ANS.CFG |
|          | [ansible/environments/distributed/files/openstack/openstack.env](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/distributed/files/openstack/openstack.env) | ANS.ENV |
|          | [ansible/environments/distributed/hosts](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/distributed/hosts) | ANS.HOSTS |
|          | [ansible/environments/docker-machine/hosts.j2.ini](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/docker-machine/hosts.j2.ini) | ANS.INI |
|          | [ansible/environments/local/hosts.j2.ini](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/local/hosts.j2.ini) | ANS.INI |
|          | [ansible/environments/vagrant/hosts](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/vagrant/hosts) | ANS.HOSTS |
|          | [ansible/files/activations_design_document_for_activations_db.json]() | JSON |
|          | [ansible/files/auth.guest]() | DATA.AUTH |
|          | [ansible/files/auth.whisk.system]() |  DATA.AUTH |
|          | [ansible/files/auth_index.json]() | JSON |
|          | [ansible/files/filter_design_document.json]() | JSON |
|          | [ansible/files/logCleanup_design_document_for_activations_db.json]() | JSON |
|          | [ansible/files/namespace_throttlings_design_document_for_subjects_db.json]() | JSON |
|          | [ansible/files/package-versions.ini]() |  ANS.INI |
|          | [ansible/files/runtimes.json]() | JSON |
|          | [ansible/files/whisks_design_document_for_activations_db_filters_v2.1.0.json]() | JSON |
|          | [ansible/files/whisks_design_document_for_activations_db_v2.1.0.json]() | JSON |
|          | [ansible/files/whisks_design_document_for_entities_db_v2.1.0.json]() | JSON |
|          | [ansible/roles/docker/templates/docker.j2]() | J2 |
|          | [ansible/roles/nginx/files/openwhisk-server-key.pem]() | PEM |
|          | [ansible/roles/nginx/templates/nginx.conf.j2]() | J2 |
|          | [ansible/roles/registry/templates/recycle-registry.py.j2]() | J2 |
|          | [ansible/templates/db_local.ini.j2]() | J2 |
|          | [ansible/templates/jmxremote.access.j2]() | J2 |
|          | [ansible/templates/jmxremote.password.j2]() | J2 |
|          | [ansible/templates/whisk.properties.j2]() | J2 |
|          | [bin/wskadmin](https://github.com/apache/incubator-openwhisk/blob/master/bin/wskadmin) | Generated, symbolic link |
|          | [bin/wskdev](https://github.com/apache/incubator-openwhisk/blob/master/bin/wskdev) | Generated, symbolic link |
|          | [common/scala/src/main/resources/logback.xml](https://github.com/apache/incubator-openwhisk/blob/master/common/scala/src/main/resources/logback.xml) | XML |
|          | [incubator-openwhisk/docs/images/OpenWhisk_flow_of_processing.draw.io.xml](https://github.com/apache/incubator-openwhisk/blob/master/docs/images/OpenWhisk_flow_of_processing.draw.io.xml) | XML |
|          | [gradle/wrapper/gradle-wrapper.jar]() | TEST.JAR |
|          | [gradle/wrapper/gradle-wrapper.properties]() | **TBD** |
|          | [gradlew.bat]() | GRDL.1 |
|          | [gradlew]() | GRDL.3 |
|          | [performance/gatling_tests/src/gatling/resources/data/javaAction.jar]() | TEST.JAR |
|          | [performance/wrk_tests/post.lua](https://github.com/apache/incubator-openwhisk/blob/master/performance/wrk_tests/post.lua) | DATA.TEXT, Performance test data file. |
|          | [tests/dat/actions/blackbox.zip]() | TEST.ZIP |
|          | [tests/dat/actions/empty.js](https://github.com/apache/incubator-openwhisk/blob/master/tests/dat/actions/empty.js) | DATA.TEST, Empty (zero-length) test data file. |
|          | [tests/dat/actions/helloJava.jar]() | TEST.JAR |
|          | [tests/dat/actions/helloJavaDefaultPackage.jar]() | TEST.JAR |
|          | [tests/dat/actions/helloSwift311.zip]() | TEST.ZIP |
|          | [tests/dat/actions/multiSwift.zip]() | TEST.ZIP |
|          | [tests/dat/actions/python.zip]() | TEST.ZIP |
|          | [tests/dat/actions/python2_virtualenv.zip]() | TEST.ZIP |
|          | [tests/dat/actions/python3_virtualenv.zip]() | TEST.ZIP |
|          | [tests/dat/actions/python_virtualenv_dir.zip]() | TEST.ZIP |
|          | [tests/dat/actions/python_virtualenv_name.zip]() | TEST.ZIP |
|          | [tests/dat/actions/seq_echo_word_count.json]() | JSON |
|          | [tests/dat/actions/seq_type_2.json]() | JSON |
|          | [tests/dat/actions/sleep.jar]() | TEST.JAR |
|          | [tests/dat/actions/unicode.jar]() | TEST.JAR |
|          | [tests/dat/actions/unicode/build.gradle]() | **FIX!!!** |
|          | [tests/dat/actions/validInput1.json]() | JSON |
|          | [tests/dat/actions/validInput2.json]() | JSON |
|          | [tests/dat/actions/word_count.json]() | JSON |
|          | [tests/dat/actions/zippedaction.zip]() | TEST.ZIP |
|          | [tests/dat/apigw/apigw_path_param_support_test_invalidActionType.json]() | JSON |
|          | [tests/dat/apigw/apigw_path_param_support_test_invalidParamName1.json]() | JSON |
|          | [tests/dat/apigw/apigw_path_param_support_test_invalidParamName2.json]() | JSON |
|          | [tests/dat/apigw/apigw_path_param_support_test_invalidTargetUrl.json]() | JSON |
|          | [tests/dat/apigw/apigw_path_param_support_test_withPathParameters1.json]() | JSON |
|          | [tests/dat/apigw/apigw_path_param_support_test_withPathParameters2.json]() | JSON |
|          | [tests/dat/apigw/endpoints.without.action.swagger.json]() | JSON |
|          | [tests/dat/apigw/testswaggerdoc1]() | OAPI. Test data. |
|          | [tests/dat/apigw/testswaggerdoc2]() | OAPI. Test data. |
|          | [tests/dat/apigw/testswaggerdocinvalid]() | OAPI. Test data. |
|          | [tests/src/test/resources/application.conf.j2]() | J2 |
|          | [tools/eclipse/java.xml](https://github.com/apache/incubator-openwhisk/blob/master/tools/eclipse/java.xml) | XML |
| [incubator-openwhisk-apigateway](https://github.com/apache/incubator-openwhisk-apigateway) | [tests/scripts/lua/management/examples](https://github.com/apache/incubator-openwhisk-apigateway/tree/master/tests/scripts/lua/management/examples) | JSON |
| [incubator-openwhisk-catalog](https://github.com/apache/incubator-openwhisk-catalog) | _None_|  |
| [incubator-openwhisk-cli](https://github.com/apache/incubator-openwhisk-cli) | _None_ | _test files?_ |
| [incubator-openwhisk-client-go](https://github.com/apache/incubator-openwhisk-client-go) | **TBD** | _?_ |
|          | wski18n/i18n_resources.go | Generated, translation JSON data file. |
|          | wski18n/README.md | **FIX!!!** |
|          | wski18n/resources | JSON data files |
| [incubator-openwhisk-runtime-docker](https://github.com/apache/incubator-openwhisk-runtime-docker) | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | [ansible/environments/local/group_vars/all]() | ANS.ALL **TODO: add ASF Mini header** |
|               | [ansible/environments/local/hosts]() | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-java](https://github.com/apache/incubator-openwhisk-runtime-java) | tests/src/test/resources/application.conf   | Config. file, Not much creativity |
|               | [ansible/environments/local/group_vars/all]() | ANS.ALL **TODO: add ASF Mini header** |
|               | [ansible/environments/local/hosts]() | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-nodejs](https://github.com/apache/incubator-openwhisk-runtime-nodejs) | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | [ansible/environments/local/group_vars/all]() | ANS.ALL **TODO: add ASF Mini header** |
|               | [ansible/environments/local/hosts]() | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-php](https://github.com/apache/incubator-openwhisk-runtime-php) | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | [ansible/environments/local/group_vars/all]() | ANS.ALL **TODO: add ASF Mini header** |
|               | [ansible/environments/local/hosts]() | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-python](https://github.com/apache/incubator-openwhisk-runtime-python) | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | [ansible/environments/local/group_vars/all]() | ANS.ALL **TODO: add ASF Mini header** |
|               | [ansible/environments/local/hosts]() | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-swift](https://github.com/apache/incubator-openwhisk-runtime-swift)  | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | [ansible/environments/local/group_vars/all]() | ANS.ALL **TODO: add ASF Mini header** |
|               | [ansible/environments/local/hosts]() | Config. file, Not much creativity |
|               | [SwiftyRequest/Package.resolved](https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/tests/dat/actions/SwiftyRequest/Package.resolved) | |
| [incubator-openwhisk-wskdeploy](https://github.com/apache/incubator-openwhisk-wskdeploy) | wski18n | **FIX!!!** Too broad, lots of .go files that SHOULD be scanned |
|          | wski18n/i18n_resources.go | Generated, translation JSON data file. |
|          | wski18n/README.md | **FIX!!!** |
|          | wski18n/resources | JSON data files |
