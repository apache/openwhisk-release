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

In addition, the type of header used (i.e., "full" ASF header or ASF approved "minified" header) is noted along with the justification as is allowed by Apache policy.

| File type | ASF Header Type | Rationale |
| --- | --- | --- |
| Source Code (e.g., .scala, .go, .java, .py, etc.) | Full ASF license header | |
| Action Functions (source) (e.g., .js, .py, .swift, etc, particularly under `tests/dat` folder.) | Mini ASF license header | Needs IP protection; Use "Mini" header as best practice for performance reasons. |
| Documentation (e.g., `*.md`, `.html`) | Full ASF license header | |
| YAML files (`*.yaml`, `*.yml`) | Full or Mini ASF license header | |
| XML files (`*.xml`) | Full or Mini ASF license header | |
| Docker file (`dockerfile`) | Full ASF license header | |
| Script files (`*.sh`) | Mini ASF license header | |
| Makefile | Full ASF license header | |
| `build.gradle` and `settings.gradle` | Full ASF license header | build script and configuration for building with Gradle |
| `gradle/docker.gradle` | Full ASF license header | build script to generate docker image using Gradle |
| `*.conf` | Full or Mini ASF license header | Configuration file |


#### Notes
- Action source files used in performance testing may be added to "[Known exclusions](#known-exclusions)" when justified.


## General Exclusions

In accordance with Apache LICENSE policies, the table below lists general exclusions by file (type) as agreed to by the project community along with the justification.

| File type | Rationale |
| --- | --- |
| Git configuration files (`.gitattributes`, `.gitignore`) | Not much creativity |
| Gradle files                                             | Not much creativity |
| IDE configuration files (e.g., `.project`)               | Not much creativity |
| Template files (`*.j2`)                                  | Not much creativity |
| JSON files (`*.json`)                                    | JSON files don't support comments |
| `i18n_resources.go`                                      | Not much creativity. The file is auto-generated; not able to add header |
| `*.env`                                                  | Configuration file. Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/ansible/environments/distributed/files/openstack/openstack.env) |
| `*.cfg`                                                  | Configuration file. Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/ansible/ansible.cfg) |
| `*.ini`                                                  | Configuration file. Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/ansible/files/package-versions.ini) |
| `*.properties`                                           | Configuration file. Not much creativity. See a sample [here](https://github.com/apache/incubator-openwhisk/blob/master/tools/eclipse/scala.properties) |
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


## Known Exclusions

For convenience, the Apache OpenWhisk project provides a listing of "Known exclusions" of files that do not include an ASF License header by project repository:
- [Apache OpenWhisk "Known exclusions"](license_exclusions.md)


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
