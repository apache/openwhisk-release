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

# License Compliance

This document describes how the Apache OpenWhisk project's source code and release artifacts maintain compliance with ASF licensing policy in the following sections:

- [Policies and rules](#policies-and-rules)
- [Project specific rules](#project-specific-rules)
- [Enforcement and verification](#enforcement-and-verification)

## Policies and rules

The Apache OpenWhisk project repositories MUST follow [Apache Release Policy](http://www.apache.org/legal/release-policy.html#licensing). every artifact distributed MUST contain only appropriately licensed code per Apache Licensing Policy. It includes two check points:
- Each package MUST provide a LICENSE file and a NOTICE file.
- With a few exceptions, source files consisting of works submitted directly to the ASF by the copyright owner or owner's agent must contain the appropriate ASF license header. Here are the exceptions:
  + Files without any degree of creativity don't require a license header.
  + Sometimes shorter form of ASF license header can be used if the recommended Apache source header is not appropriate.

## Project specific rules

In accordance with Apache LICENSE policies, the following tables lists the specific files, by type, that the community has discussed and have agreed MUST have a license or can be exlcuded.

**Note**: These lists are not comprehensive and are intended to be informative only. Each project repository's respective LICENSE and NOTICE files should be considered the canonical source for their specific licensing declarations.

For convenience, we provide a summary listing of all project LICENSE and NOTICE files along with notable dependencies in  from this repository's [Apache OpenWhisk LICENSE and NOTICE Summary](project_licenses.md#apache-openWhisk-license-and-notice-summary) file.

### Project ASF License header policy

In accordance with Apache LICENSE policies, the table below lists files/file types that the community affirms MUST have an Apache LICENSE header since they are creating works representing Intellectual Property.

In addition, the recommended type of approved ASF license header (i.e., "full" or "minified" header) is noted as best practice.

| File type | ASF Header Type | Rationale |
| :--- | :--- | :--- |
| Source code (e.g., `*.scala`, `*.go`, `*.java`, `*.py`, etc.) | Full | Source code. |
| Action functions (source) (e.g., `.js`, `.py`, `.swift`, etc, particularly under `tests/dat` folder.) | Mini | Source code</br>Use "Mini" header as best practice for performance reasons. |
| Docker image build file (`dockerfile`) | Mini | May contain functional (script) code. |
| Documentation (e.g., `*.md`) | Full | Intellectual property. |
| Gradle files (`build.gradle`, `*.gradle`) | Full |  May contain functional scripts and code (e.g., Groovy, Kotlin).</br>Includes build (`build.gradle`) and settings (`settings.gradle`)files. |
| Gradle properties files (`*.properties`) | Mini | Project convention. |
| Groovy code (`*.groovy`) | Full | Source code. |
| Makefile | Full | May contain functional (script) code. |
| Scala Configurations (`*.conf`) | Full | Scala (Java)  configuration files may contain code or interfaces. |
| Scala Properties (`*.properties`) | Mini | Project convention.</br>Example: [incubator-openwhisk/blob/master/tools/eclipse/scala.properties](https://github.com/apache/incubator-openwhisk/blob/master/tools/eclipse/scala.properties) |
| Script files (`*.sh`) | Mini | May contain functional (script) code. |
| Vagrantfile configuration file (`Vagrantfile`)| Full | Project convention. |
| Web Content (e.g., `*.html`, `.css`) | Full | Source code. |
| XML files (`*.xml`) | Mini | May contain functional code. |
| YAML files (`*.yaml`, `*.yml`) | Mini | May contain functional code.<br/>Note: Includes (`.travis.yml`)|

#### Notes
- Full ASF License headers are always accepted regardless if a "Mini" header is recommended as best practice.
- Action source files used in performance testing may be added to "[Known exclusions](#known-exclusions)" when justified.


## General Exclusions

In accordance with Apache LICENSE policies, the table below lists general exclusions by file (type) as agreed to by the project community along with the justification.

| TAG | File type | Rationale |
|:---|:---|:---|
| ANS.1 | Ansible (host) Inventory Files (`*.ini`) | Configuration files. Not much creativity.<br/>Example: [incubator-openwhisk/ansible/environments/local/hosts.j2.ini](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/local/hosts.j2.ini) |
| ANS.2| Ansible Configuration Files (`*.cfg`) | Configuration files. Not much creativity.<br/>Example: [incubator-openwhisk/ansible/ansible.cfg](https://github.com/apache/incubator-openwhisk/blob/master/ansible/ansible.cfg) |
| ANS.3 | Ansible Group Variable (YAML) files (`group_vars/all`) | Configuration file.</br>Example [ansible/environments/local/group_vars/all](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/local/group_vars/all) |
| ANS.4 | Ansible hosts files (`hosts`) | Not much creativity.</br>Example: [incubator-openwhisk/ansible/environments/distributed/hosts](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/distributed/hosts) |
| BIN.1 | Binary Image files (e.g., `.png`, `.ico`) | Binary files.</br>Example: [incubator-openwhisk/docs/images/OpenWhisk.png](https://github.com/apache/incubator-openwhisk/blob/master/docs/images/OpenWhisk.png) |
| DATA.1 | Empty (zero-length) test files | Empty test data file.</br>Example: [incubator-openwhisk/tests/dat/actions/empty.js](https://github.com/apache/incubator-openwhisk/blob/master/tests/dat/actions/empty.js) |
| GIT.1 | Git configuration (`.gitattributes`, `.gitignore`) | Configuration file. Not much creativity.  |
| GIT.2 | Git tracking (`.git` subdirectory) | Git file tracking. Not part of project source. |
| I18N.1 | Golang Internationalization resource files (`i18n_resources.go`) | Not much creativity. The file is auto-generated; not able to add header.</br>Example: [incubator-openwhisk-client-go/wski18n/i18n_resources.go](https://github.com/apache/incubator-openwhisk-client-go/blob/master/wski18n/i18n_resources.go) |
| GRDL.1 | Gradle batch files (`gradlew.bat`)| Generated by Gradle wrapper.</br>Example: [incubator-openwhisk/blob/master/gradlew.bat](https://github.com/apache/incubator-openwhisk/blob/master/gradlew.bat) |
| GRDL.2 | Gradle files (`.gogradle`) | Not much creativity |
| GRDL.3 | Gradle Wrapper files (`gradlew`) | Generated by Gradle wrapper.</br>Example: [incubator-openwhisk/gradlew](https://github.com/apache/incubator-openwhisk/blob/master/gradlew) |
| IDE | IDE configuration files (e.g., `.project`) | Not much creativity. |
| J2 | Jinja2 Template files (`*.j2`) | **REVIEW** Not much creativity.</br>Example: [incubator-openwhisk/ansible/templates/whisk.properties.j2](https://github.com/apache/incubator-openwhisk/blob/master/ansible/templates/whisk.properties.j2) |
| JSON | JSON files (`*.json`) | Configuration and test data files.</br> - Note: _JSON files don't support comments_</br>Example: [incubator-openwhisk/tests/dat/actions/echo.json](https://github.com/apache/incubator-openwhisk/blob/master/tests/dat/actions/echo.json) |
| KUBE.1 | Kubernetes Configurations (e.g., `*.env`) | Configuration file. Not much creativity.<br/>Example: [incubator-openwhisk//ansible/environments/distributed/files/openstack/openstack.env](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/distributed/files/openstack/openstack.env) |
| OAPI | Open API (Swagger) documents | JSON files describing API input data.</br>Example: [incubator-openwhisk/blob/master/tests/dat/apigw/testswaggerdoc2](https://github.com/apache/incubator-openwhisk/blob/master/tests/dat/apigw/testswaggerdoc2) for test input data |
| PEM | Privacy Enhanced Mail (PEM) files (`*.pem`) | Contains generated, base64-encoded x509 keys.</br>Example: [incubator-openwhisk/ansible/roles/nginx/files/openwhisk-server-key.pem](https://github.com/apache/incubator-openwhisk/blob/master/ansible/roles/nginx/files/openwhisk-server-key.pem)|
| PYDEV | PyDev configuration files (`.pydevproject`) | Not much creativity |
| IGNORE | Tooling "ignore" files (e.g., `.gitignore`, `.dockerignore`) | Not included in source release. |


# Known exclusions

## License scanning exclusions

The Apache OpenWhisk project enforces and verifies ASF License header conformance on all source files using the project's own scanCode utility (on all Travis CI builds) and Apache RAT tool (on all automated releases).

In accordance with Apache policy, these utilities exclude specific files from the ASF license header requirement which are configured in the following files:
- scanCode: [ASF-Release.cfg](https://github.com/apache/incubator-openwhisk-utilities/blob/master/scancode/ASF-Release.cfg)
- Apache RAT: [pom.xml](https://github.com/apache/incubator-openwhisk-release/blob/master/tools/lib/pom.xml) (Apache Rat)

## Bundled and non-Bundled dependencies

In accordance with Apache policy, each of the Apache OpenWhisk project's repositories respective LICENSE and NOTICE files contain the full, canonical listing of all dependent software licenses.

For convenience, the following table provides links to each project repository's LICENSE and NOTICE files, as well as an overview of notable software dependencies (non-canonical) and license scanning exclusions.

| Repository | Exclusion | Rationale [TAG] |
|:---|:---|:---|
| [incubator-openwhisk](https://github.com/apache/incubator-openwhisk) |||
|          | [ansible/ansible.cfg]() | ANS.2 |
|          | [ansible/environments/distributed/files/openstack/openstack.env]() |  |
|          | [ansible/environments/distributed/group_vars/all]() | ANS.3 |
|          | [ansible/environments/distributed/hosts]() | ANS.4 |
|          | [ansible/environments/docker-machine/group_vars/all]() | ANS.3 |
|          | [ansible/environments/docker-machine/hosts.j2.ini]() |  |
|          | [ansible/environments/local/group_vars/all]() | ANS.3 |
|          | [ansible/environments/local/hosts.j2.ini]() |  |
|          | [ansible/environments/vagrant/group_vars/all]() | ANS.3 |
|          | [ansible/environments/vagrant/hosts]() | ANS.4 |
|          | [ansible/files/activations_design_document_for_activations_db.json]() | JSON |
|          | [ansible/files/auth.guest]() |  |
|          | [ansible/files/auth.whisk.system]() |  |
|          | [ansible/files/auth_index.json]() | JSON |
|          | [ansible/files/filter_design_document.json]() | JSON |
|          | [ansible/files/logCleanup_design_document_for_activations_db.json]() | JSON |
|          | [ansible/files/namespace_throttlings_design_document_for_subjects_db.json]() | JSON |
|          | [ansible/files/package-versions.ini]() |  |
|          | [ansible/files/runtimes.json]() | JSON |
|          | [ansible/files/whisks_design_document_for_activations_db_filters_v2.1.0.json]() | JSON |
|          | [ansible/files/whisks_design_document_for_activations_db_v2.1.0.json]() | JSON |
|          | [ansible/files/whisks_design_document_for_entities_db_v2.1.0.json]() | JSON |
|          | [ansible/group_vars/all]() | ANS.3 |
|          | [ansible/roles/docker/templates/docker.j2]() | J2 |
|          | [ansible/roles/nginx/files/openwhisk-server-key.pem]() |  |
|          | [ansible/roles/nginx/templates/nginx.conf.j2]() | J2 |
|          | [ansible/roles/registry/templates/recycle-registry.py.j2]() | J2 |
|          | [ansible/templates/db_local.ini.j2]() | J2 |
|          | [ansible/templates/jmxremote.access.j2]() | J2 |
|          | [ansible/templates/jmxremote.password.j2]() | J2 |
|          | [ansible/templates/whisk.properties.j2]() | J2 |
|          | [bin/wskadmin](https://github.com/apache/incubator-openwhisk/blob/master/bin/wskadmin) | Generated, symbolic link |
|          | [bin/wskdev](https://github.com/apache/incubator-openwhisk/blob/master/bin/wskdev) | Generated, symbolic link |
|          | [common/scala/.dockerignore]() |  |
|          | [common/scala/src/main/resources/logback.xml](https://github.com/apache/incubator-openwhisk/blob/master/common/scala/src/main/resources/logback.xml) | Configuration file in XML format. Not much creativity. |
|          | [gradle/wrapper/gradle-wrapper.jar]() |  |
|          | [gradle/wrapper/gradle-wrapper.properties]() |  |
|          | [gradlew.bat]() |  |
|          | [gradlew]() |  |
|          | [performance/gatling_tests/src/gatling/resources/data/javaAction.jar]() |  |
|          | [performance/wrk_tests/post.lua](https://github.com/apache/incubator-openwhisk/blob/master/performance/wrk_tests/post.lua) | Perf. test file. Not much creativity. |
|          | [tests/dat/actions/blackbox.zip]() |  |
|          | [tests/dat/actions/empty.js](https://github.com/apache/incubator-openwhisk/blob/master/tests/dat/actions/empty.js) | Empty (zero-length) file for testing. Not much creativity. |
|          | [tests/dat/actions/helloJava.jar]() |  |
|          | [tests/dat/actions/helloJavaDefaultPackage.jar]() |  |
|          | [tests/dat/actions/helloSwift311.zip]() |  |
|          | [tests/dat/actions/multiSwift.zip]() |  |
|          | [tests/dat/actions/python.zip]() |  |
|          | [tests/dat/actions/python2_virtualenv.zip]() |  |
|          | [tests/dat/actions/python3_virtualenv.zip]() |  |
|          | [tests/dat/actions/python_virtualenv_dir.zip]() |  |
|          | [tests/dat/actions/python_virtualenv_name.zip]() |  |
|          | [tests/dat/actions/seq_echo_word_count.json]() |  |
|          | [tests/dat/actions/seq_type_2.json]() | JSON |
|          | [tests/dat/actions/sleep.jar]() |  |
|          | [tests/dat/actions/unicode.jar]() |  |
|          | [tests/dat/actions/unicode/build.gradle]() | **FIX!!!** |
|          | [tests/dat/actions/validInput1.json]() | JSON |
|          | [tests/dat/actions/validInput2.json]() | JSON |
|          | [tests/dat/actions/word_count.json]() | JSON |
|          | [tests/dat/actions/zippedaction.zip]() |  |
|          | [tests/dat/apigw/apigw_path_param_support_test_invalidActionType.json]() | JSON |
|          | [tests/dat/apigw/apigw_path_param_support_test_invalidParamName1.json]() | JSON |
|          | [tests/dat/apigw/apigw_path_param_support_test_invalidParamName2.json]() | JSON |
|          | [tests/dat/apigw/apigw_path_param_support_test_invalidTargetUrl.json]() | JSON |
|          | [tests/dat/apigw/apigw_path_param_support_test_withPathParameters1.json]() | JSON |
|          | [tests/dat/apigw/apigw_path_param_support_test_withPathParameters2.json]() | JSON |
|          | [tests/dat/apigw/endpoints.without.action.swagger.json]() | JSON |
|          | [tests/dat/apigw/testswaggerdoc1]() | OAPI. Test data. |
|          | [tests/dat/apigw/testswaggerdoc2]() | OAPI. Test data. |
|          | [tests/dat/apigw/testswaggerdocinvalid]() OAPI. Test data. | |
|          | [tests/src/test/resources/application.conf.j2]() | J2 |
|          | [tools/eclipse/java.xml](https://github.com/apache/incubator-openwhisk/blob/master/tools/eclipse/java.xml) | Configuration file in XML format. Not much creativity. |
|          | [tools/vagrant/hello.cmd]() | |
|          | [tools/vagrant/Vagrantfile]() | |
| [incubator-openwhisk-apigateway](https://github.com/apache/incubator-openwhisk-apigateway) | [tests/scripts/lua/management/examples](https://github.com/apache/incubator-openwhisk-apigateway/tree/master/tests/scripts/lua/management/examples) | JSON data files |
| [incubator-openwhisk-catalog](https://github.com/apache/incubator-openwhisk-catalog) | _None_|  |
| [incubator-openwhisk-cli](https://github.com/apache/incubator-openwhisk-cli) | _None_ | _test files?_ |
| [incubator-openwhisk-client-go](https://github.com/apache/incubator-openwhisk-client-go) | **TBD** | _?_ |
|          | wski18n/i18n_resources.go | Generated, translation JSON data file. |
|          | wski18n/README.md | **FIX!!!** |
|          | wski18n/resources | JSON data files |
| [incubator-openwhisk-runtime-docker](https://github.com/apache/incubator-openwhisk-runtime-docker) | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | [ansible/environments/local/group_vars/all]() | Config. file, Not much creativity |
|               | [ansible/environments/local/hosts]() | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-java](https://github.com/apache/incubator-openwhisk-runtime-java) | tests/src/test/resources/application.conf   | Config. file, Not much creativity |
|               | [ansible/environments/local/group_vars/all]() | Config. file, Not much creativity |
|               | [ansible/environments/local/hosts]() | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-nodejs](https://github.com/apache/incubator-openwhisk-runtime-nodejs) | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | [ansible/environments/local/group_vars/all]() | Config. file, Not much creativity |
|               | [ansible/environments/local/hosts]() | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-php](https://github.com/apache/incubator-openwhisk-runtime-php) | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | [ansible/environments/local/group_vars/all]() | Config. file, Not much creativity |
|               | [ansible/environments/local/hosts]() | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-python](https://github.com/apache/incubator-openwhisk-runtime-python) | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | [ansible/environments/local/group_vars/all]() | Config. file, Not much creativity |
|               | [ansible/environments/local/hosts]() | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-swift](https://github.com/apache/incubator-openwhisk-runtime-swift)  | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | [ansible/environments/local/group_vars/all]() | Config. file, Not much creativity |
|               | [ansible/environments/local/hosts]() | Config. file, Not much creativity |
|               | [SwiftyRequest/Package.resolved](https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/tests/dat/actions/SwiftyRequest/Package.resolved) | |
| [incubator-openwhisk-wskdeploy](https://github.com/apache/incubator-openwhisk-wskdeploy) | wski18n | **FIX!!!** Too broad, lots of .go files that SHOULD be scanned |
|          | wski18n/i18n_resources.go | Generated, translation JSON data file. |
|          | wski18n/README.md | **FIX!!!** |
|          | wski18n/resources | JSON data files |


#### Note
- Tracking issues for all prokect LICENSE and NOTICE files exclusions/exceptions/TODOs can he found [license_exclusions.md](license_exclusions.md).

## Enforcement and verification

This section describes how the Apache OpenWhisk project enforces and verifies LICENSE and NOTICE file compliance as part of the DevOps and Release processes.

### ScanCode

This utility is used to enforce LICENSE compliance on all contributions as they are submitted to GitHub.

The scancode utility code and documentation are under the [OpenWhisk Utilities](https://github.com/apache/incubator-openwhisk-utilities) repository.  The community has agreed that all repositories MUST include ASF LICENSE scanning as part of the Travis Continuous Integration (CI) process enabled to run on every contribution via a GitHub Pull Request (PR).  This means no new or updated files can be merged unless they have a valid ASF LICENSE header where required by policy.

- The Utility itself is here: [scancode](https://github.com/apache/incubator-openwhisk-utilities/tree/master/scancode)
- The ASF Compliance configuration is here: [ASF-Release.cfg](https://github.com/apache/incubator-openwhisk-utilities/blob/master/scancode/ASF-Release.cfg)

The [README](https://github.com/apache/incubator-openwhisk-release/blob/master/README.md) for this repository includes a table that indicates where the scancode utility is invoked, as part of the GitHub Travis CI process, per project repository.

### Apache Rat

The Apache Rat tool is used to verify LICENSE and NOTICE file compliance as part of the release process.

[verify_source_code.sh](../tools/verify_source_code.sh) in the `tools` folder is to verify license compliance. [Apache Rat](https://creadur.apache.org/rat/) is used to verify license headers. Files excluded license header verification following the previous rules are configured in the file [pom.xml](../tools/travis/pom.xml).

```
cd $OPENWHISK_SOURCE_DIR
cp $SCRIPTDIR/lib/pom.xml ./
mvn clean apache-rat:check
```

The script snippet, shown below, is used to check LICENSE file and NOTICE file in every repository when either an automated or manual release is initiated by a Release Manager.

```
for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    echo "Check the repository $repo_name"
    cd $OPENWHISK_CLEANED_SOURCE_DIR/$repo_name && ls {LICENSE*,NOTICE*}
done
```

#### How to run

After downloading the source codes to your local disk, run the following script to verify license compliance:
```
$ ./tools/travis/verify_source_code.sh <WORK_DIR>
```

### Apache Tentacles

Although [Apache Tentacles](https://creadur.apache.org/tentacles/) is a tool to check LICENSE file and NOTICE file in artifacts uploading to a staging repository, it is not usable for the Apache OpenWhisk project because it doesn't support the unpacking of tar.gz files.### Known exclusions


Google Calendar link: <a target="_blank" href="https://calendar.google.com/event?action=TEMPLATE&amp;tmeid=NXE5ajZxMmI2NW90czVxb3ZpaTZtcXZpMHBfMjAxODA1MjNUMTUwMDAwWiBhcGFjaGVvcGVud2hpc2tAbQ&amp;tmsrc=apacheopenwhisk%40gmail.com&amp;scp=ALL"><img border="0" src="https://www.google.com/calendar/images/ext/gc_button1_en.gif"></a>
