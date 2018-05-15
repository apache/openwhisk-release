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

In addition, the recommended type of approved ASF license header (i.e., "full" or "minified" header) is noted although a Full header is always accepted.

| File type | ASF Header Type | Rationale |
| --- | --- | --- |
| Source Code (e.g., .scala, .go, .java, .py, etc.) | Full | |
| Documentation (e.g., `*.md`) | Full | |
| Web Content (e.g., `*.html`, `.css`) | Full | |
| Action Functions (source) (e.g., .js, .py, .swift, etc, particularly under `tests/dat` folder.) | Mini | Needs IP protection; Use "Mini" header as best practice for performance reasons. |
| YAML files (`*.yaml`, `*.yml`) | Mini | |
| XML files (`*.xml`) | Mini | |
| Docker file (`dockerfile`) | Mini | |
| Script files (`*.sh`) | Mini | |
| Makefile | Full | |
| `build.gradle` and `settings.gradle` | Full | build script and configuration for building with Gradle |
| `gradle/docker.gradle` | Full | build script to generate docker image using Gradle |
| `*.conf` | Full or Mini | Configuration file |


#### Notes
- Action source files used in performance testing may be added to "[Known exclusions](#known-exclusions)" when justified.


## General Exclusions

In accordance with Apache LICENSE policies, the table below lists general exclusions by file (type) as agreed to by the project community along with the justification.

| File type | Rationale |
| --- | --- |
| Git configuration files (`.git`, `.gitattributes`, `.gitignore`) | Not much creativity |
| PyDev configuration files (`.pydevproject`) | Not much creativity |
| Gradle files (`.gogradle`) | Not much creativity |
| IDE configuration files (e.g., `.project`) | Not much creativity |
| Template files (`*.j2`) | Not much creativity |
| JSON files (`*.json`) | JSON files don't support comments |
| `i18n_resources.go`                                      | Not much creativity. The file is auto-generated; not able to add header |
| Kubernetes Configurations (e.g., `*.env`) | Configuration file. Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/distributed/files/openstack/openstack.env) |
| Ansible Configuration Files (`*.cfg`, `*.ini`) | Configuration files. Not much creativity. Examples:
- [.cfg](https://github.com/apache/incubator-openwhisk/blob/master/ansible/ansible.cfg)
- [.ini](https://github.com/apache/incubator-openwhisk/blob/master/ansible/files/package-versions.ini) |
| Scala Properties (`*.properties`)                                           | Configuration file. Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/tools/eclipse/scala.properties) |
| `group_vars/all`                                         | Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/ansible/environments/local/group_vars/all) |
| `hosts`                                                  | Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk-runtime-nodejs/blob/master/ansible/environments/local/hosts) |
| `dockerhub.groovy`                                       | Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/tools/jenkins/apache/dockerhub.groovy) |
| `openwhisk/actionRuntimes/*/Dockerfile`                  | Simple docker file without creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/actionRuntimes/python2Action/Dockerfile) |
| `openwhisk/sdk/docker/Dockerfile`                        | Simple docker file without creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/sdk/docker/Dockerfile) |
| `openwhisk/tests/dat/apigw/testswaggerdoc*`                        | JSON files as test input data. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/tests/dat/apigw/testswaggerdoc2) |
| `openwhisk/tests/dat/actions/empty.js`                        | Empty file. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/tests/dat/actions/empty.js) |
| `SwiftyRequest/Package.resolved`                        | Configuration used by Swift Package Manager. See a sample [here](https://github.com/apache/incubator-openwhisk-runtime-swift/blob/master/tests/dat/actions/SwiftyRequest/Package.resolved) |
| `gradlew.bat` and `gradlew`                     | Generated by Gradle wrapper. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/gradlew.bat) |


# Known exclusions

## License scanning exclusions

The Apache OpenWhisk project enforces and verifies ASF License header conformance on all source files using the project's own scanCode utility (on all Travis CI builds) and Apache RAT tool (on all automated releases).

In accordance with Apache policy, these utilities exclude specific files from the ASF license header requirement which are configured in the following files:
- scanCode: [ASF-Release.cfg](https://github.com/apache/incubator-openwhisk-utilities/blob/master/scancode/ASF-Release.cfg)
- Apache RAT: [pom.xml](https://github.com/apache/incubator-openwhisk-release/blob/master/tools/lib/pom.xml) (Apache Rat)

## Bundled and non-Bundled dependencies

In accordance with Apache policy, each of the Apache OpenWhisk project's repositories respective LICENSE and NOTICE files contain the full, canonical listing of all dependent software licenses.

For convenience, the following table provides links to each project repository's LICENSE and NOTICE files, as well as an overview of notable software dependencies (non-canonical) and license scanning exclusions.

| Repository | Exclusion | Rationale |
| --- | --- | --- |
| [incubator-openwhisk](https://github.com/apache/incubator-openwhisk) | [tests/dat/actions/empty.js](https://github.com/apache/incubator-openwhisk/blob/master/tests/dat/actions/empty.js) | Empty (zero-length) file for testing |
|          | [performance/wrk_tests/post.lua](https://github.com/apache/incubator-openwhisk/blob/master/performance/wrk_tests/post.lua) |  |
|          | [tools/eclipse/java.xml](https://github.com/apache/incubator-openwhisk/blob/master/tools/eclipse/java.xml) | Configuration file in XML format. Not much creativity. |
|          | [common/scala/src/main/resources/logback.xml](https://github.com/apache/incubator-openwhisk/blob/master/common/scala/src/main/resources/logback.xml) | Configuration file in XML format. Not much creativity. |
|          | bin/wskadmin | Generated, symbolic link |
|          | bin/wskdev | Generated, symbolic link |
| [incubator-openwhisk-catalog](https://github.com/apache/incubator-openwhisk-catalog) | _None_|  |
| [incubator-openwhisk-apigateway](https://github.com/apache/incubator-openwhisk-apigateway) | [tests/scripts/lua/management/examples](https://github.com/apache/incubator-openwhisk-apigateway/tree/master/tests/scripts/lua/management/examples) | JSON data files |
| [incubator-openwhisk-cli](https://github.com/apache/incubator-openwhisk-cli) | _None_ | _test files?_ |
| [incubator-openwhisk-client-go](https://github.com/apache/incubator-openwhisk-client-go) | _None_ | _?_ |
| [incubator-openwhisk-wskdeploy](https://github.com/apache/incubator-openwhisk-wskdeploy) | wski18n | **FIX!!!** Too broad, lots of .go files that SHOULD be scanned |
|          | wski18n/i18n_resources.go | Generated, translation JSON data file. |
|          | wski18n/README.md | **FIX!!!** |
|          | wski18n/resources | JSON data files |
| [incubator-openwhisk-runtime-nodejs](https://github.com/apache/incubator-openwhisk-runtime-nodejs) | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | ansible/environments/local/group_vars/all | Config. file, Not much creativity |
|               | ansible/environments/local/hosts          | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-swift](https://github.com/apache/incubator-openwhisk-runtime-swift)  | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | ansible/environments/local/group_vars/all | Config. file, Not much creativity |
|               | ansible/environments/local/hosts          | Config. file, Not much creativity |
|               | tests/dat/actions/SwiftyRequest/Package.resolved | **TBD?** |
| [incubator-openwhisk-runtime-docker](https://github.com/apache/incubator-openwhisk-runtime-docker) | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | ansible/environments/local/group_vars/all | Config. file, Not much creativity |
|               | ansible/environments/local/hosts          | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-java](https://github.com/apache/incubator-openwhisk-runtime-java) | tests/src/test/resources/application.conf   | Config. file, Not much creativity |
|               | ansible/environments/local/group_vars/all | Config. file, Not much creativity |
|               | ansible/environments/local/hosts          | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-php](https://github.com/apache/incubator-openwhisk-runtime-php) | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | ansible/environments/local/group_vars/all | Config. file, Not much creativity |
|               | ansible/environments/local/hosts          | Config. file, Not much creativity |
| [incubator-openwhisk-runtime-python](https://github.com/apache/incubator-openwhisk-runtime-python) | tests/src/test/resources/application.conf | Config. file, Not much creativity |
|               | ansible/environments/local/group_vars/all | Config. file, Not much creativity |
|               | ansible/environments/local/hosts          | Config. file, Not much creativity |

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
