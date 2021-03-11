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

- Each project repository MUST provide a LICENSE file and a NOTICE file.
- With a few exceptions, source files consisting of works submitted directly to the ASF by the copyright owner or owner's agent must contain the appropriate ASF license header. Here are the exceptions:

  - Files without any degree of creativity don't require a license header.
  - Sometimes shorter form of ASF license header can be used if the recommended Apache source header is not appropriate.

## Project specific rules

In accordance with Apache LICENSE policies, the following tables lists the specific files, by type, that the community has discussed and have agreed MUST have an ASF approved Apache 2 license or can be excluded for a valid approved reason.

**Note**: These lists are not comprehensive and are intended to be informative only. Each project repository's respective LICENSE and NOTICE files should be considered the canonical source for their specific licensing declarations.

### Project ASF License header policy

In accordance with Apache LICENSE policies, the table below lists files/file types that the community affirms MUST have an Apache LICENSE header since they are creating works representing Intellectual Property.

In addition, the recommended type of approved ASF license header (i.e., "full" or "minified" header) is noted as best practice.

| File type | ASF Header Type | Rationale |
| :--- | :--- | :--- |
| Source code (e.g., `*.scala`, `*.go`, `*.java`, `*.py`, etc.) | Full | Source code. |
| Action functions (source) (e.g., `.js`, `.py`, `.swift`, etc, particularly under `tests/dat` folder.) | Full | Source code.</br>Use "Mini" header as best practice for performance reasons. |
| Ansible Group vars. (YAML) (`*/group_vars/all`) | Full | Project convention. |
| Docker image build file (`Dockerfile`) | Full | May contain functional (script) code. |
| Documentation (e.g., `*.md`) | Full | Intellectual property. |
| Gradle files (`build.gradle`, `*.gradle`) | Full |  May contain functional scripts and code (e.g., Groovy, Kotlin).</br>Includes build (`build.gradle`) and settings (`settings.gradle`)files. |
| Gradle properties files (`*.properties`) | Full | Project convention. |
| Groovy code (`*.groovy`) | Full | Source code. |
| Makefile | Full | May contain functional (script) code. |
| Scala Configurations (`*.conf`) | Full | Scala (Java)  configuration files may contain code or interfaces. |
| Scala Properties (`*.properties`) | Full | Project convention.</br>Example: [openwhisk/blob/master/tools/eclipse/scala.properties](https://github.com/apache/openwhisk/blob/master/tools/eclipse/scala.properties) |
| Script files (`*.sh`) | Full | May contain functional (script) code. |
| Vagrantfile configuration file (`Vagrantfile`)| Full | Project convention. |
| Web Content (e.g., `*.html`, `.css`) | Full | Source code. |
| Windows Command file (`*.cmd`) | Full | May contain functional code. |
| YAML files (`*.yaml`, `*.yml`) | Full | May contain functional code.<br/>Note: Includes (`.travis.yml`)|

#### Notes
- Full ASF License headers are always accepted regardless if a "Mini" header is recommended as best practice.
- Action source files used in performance testing may be added to "[Known exclusions](#known-exclusions)" when justified.

## General Exclusions

In accordance with Apache LICENSE policies, the table below lists general exclusions by file (type) as agreed to by the project community along with the justification.

| TAG | File type | Rationale |
|:---|:---|:---|
| ANS.CFG| Ansible Configuration Files (`*.cfg`) | Configuration files. Not much creativity.<br/>Example: [openwhisk/ansible/ansible.cfg](https://github.com/apache/openwhisk/blob/master/ansible/ansible.cfg) |
| ANS.ENV | Ansible environment files (`*.env`) | Configuration files. Not much creativity.</br>Example: [ansible/environments/distributed/files/openstack/openstack.env](https://github.com/apache/openwhisk/blob/master/ansible/environments/distributed/files/openstack/openstack.env) |
| ANS.HOSTS | Ansible hosts files (`hosts`) | Configuration files. Not much creativity.</br>Example: [openwhisk/ansible/environments/distributed/hosts](https://github.com/apache/openwhisk/blob/master/ansible/environments/distributed/hosts) |
| ANS.INI | Ansible (host) Inventory Files (`*.ini`) | Configuration files. Not much creativity.<br/>Example: [openwhisk/ansible/environments/local/hosts.j2.ini](https://github.com/apache/openwhisk/blob/master/ansible/environments/local/hosts.j2.ini) |
| API.ENC | Encrypted API Credentials used in Travis | Configuration data.</br>Example: [openwhisk-catalog/credentials.json.enc](https://github.com/apache/openwhisk-catalog/blob/master/credentials.json.enc) |
| DATA.AUTH | API Auth. key | Configuration data.</br>Example: [ansible/files/auth.guest](https://github.com/apache/openwhisk/blob/master/ansible/files/auth.guest) |
| DATA.TEST | Empty (zero-length) test files | Empty test data file.</br>Example: [openwhisk/tests/dat/actions/empty.js](https://github.com/apache/openwhisk/blob/master/tests/dat/actions/empty.js) |
| GIT.1 | Git configuration (`.gitattributes`, `.gitignore`) | Configuration file. Not much creativity.  |
| GIT.2 | Git tracking (`.git` subdirectory) | Git file tracking. Not part of project source. |
| GODEPS.JSON | GoDeps dependencies data (`Godeps.json`) |  | JSON data generated by the GoDeps utility.</br>Example: [openwhisk-wskdeploy/blob/master/Godeps/Godeps.json](https://github.com/apache/openwhisk-wskdeploy/blob/master/Godeps/Godeps.json) |
| GODEPS.README | GoDeps Readme file (`Readme`) | Plain text Readme generated by the GoDeps utility; states the directory and JSON file within it were autogenerated. |
| GRDL.PROP | Gradle Wrapper properties (`gradle-wrapper.properties`) | Generated by Gradle.</br>Example: [openwhisk-cli/gradle/wrapper/gradle-wrapper.properties](https://github.com/apache/openwhisk-cli/blob/master/gradle/wrapper/gradle-wrapper.properties)|
| I18N.1 | Golang Internationalization resource files (`i18n_resources.go`) | Not much creativity. The file is auto-generated; not able to add header.</br>Example: [openwhisk-client-go/wski18n/i18n_resources.go](https://github.com/apache/openwhisk-client-go/blob/master/wski18n/i18n_resources.go) |
| IDE | IDE configuration files (e.g., `.project`) | Not much creativity. |
| IGNORE | Tooling "ignore" files (e.g., `.gitignore`, `.dockerignore`) | Not included in source release. |
| IMAGE | Binary Image files (e.g., `.png`, `.jpg`, `.ico`) | Binary files.</br>Example: [openwhisk/docs/images/OpenWhisk.png](https://github.com/apache/openwhisk/blob/master/docs/images/OpenWhisk.png) |
| J2 | Jinja2 Template files (`*.j2`) | **REVIEW** Not much creativity.</br>Example: [openwhisk/ansible/templates/whisk.properties.j2](https://github.com/apache/openwhisk/blob/master/ansible/templates/whisk.properties.j2) |
| JSON | JSON files (`*.json`) | Configuration and test data files.</br> - Note: _JSON files don't support comments_</br>Example: [openwhisk/tests/dat/actions/echo.json](https://github.com/apache/openwhisk/blob/master/tests/dat/actions/echo.json) |
| KUBE.1 | Kubernetes Configurations (e.g., `*.env`) | Configuration file. Not much creativity.<br/>Example: [openwhisk//ansible/environments/distributed/files/openstack/openstack.env](https://github.com/apache/openwhisk/blob/master/ansible/environments/distributed/files/openstack/openstack.env) |
| OAPI | Open API (Swagger) documents | JSON files describing API input data.</br>Example: [openwhisk/blob/master/tests/dat/apigw/testswaggerdoc2](https://github.com/apache/openwhisk/blob/master/tests/dat/apigw/testswaggerdoc2) for test input data |
| PEM | Privacy Enhanced Mail (PEM) files (`*.pem`) | Contains generated, base64-encoded x509 keys.</br>Example: [openwhisk/ansible/roles/nginx/files/openwhisk-server-key.pem](https://github.com/apache/openwhisk/blob/master/ansible/roles/nginx/files/openwhisk-server-key.pem)|
| PROFILE | Profiling configuration scripts (`.profiling.*`) | Configure Docker container for profiling (build). |
| PYDEV | PyDev configuration files (`.pydevproject`) | Not included in source release. |
| TEST.JAR | Java Application Resource (JAR) files (`*.jar`) | Binary JAR files used for testing (Actions). |
| TEST.ZIP | ZIP compressed archive files (`*.zip`) | Binary ZIP files used for testing (Actions). |
| XML | XML files (`*.xml`) | Configuration and test data files.</br>Example: [openwhisk/tools/eclipse/java.xml](https://github.com/apache/openwhisk/blob/master/tools/eclipse/java.xml) |

# Known exclusions

## License scanning exclusions

The Apache OpenWhisk project enforces and verifies ASF License header conformance on all source files using the project's own scanCode utility (on all Travis CI builds) and Apache RAT tool (on all automated releases).

In accordance with Apache policy, these utilities exclude specific files from the ASF license header requirement which are configured in the following files:
- scanCode: [ASF-Release.cfg](https://github.com/apache/openwhisk-utilities/blob/master/scancode/ASF-Release.cfg)
- Apache RAT: [pom.xml](https://github.com/apache/openwhisk-release/blob/master/tools/lib/pom.xml) (Apache Rat)

### ASF License header exclusions
The following page contains a non-comprehensive listing of all project files, by repository that are known to not have ASF license headers along with the policy tag indicating the justification against the table above: [license_exclusions.md](license_exclusions.md)

## Enforcement and verification

This section describes how the Apache OpenWhisk project enforces and verifies LICENSE and NOTICE file compliance as part of the DevOps and Release processes.

### ScanCode

This utility is used to enforce LICENSE compliance on all contributions as they are submitted to GitHub.

The scancode utility code and documentation are under the [OpenWhisk Utilities](https://github.com/apache/openwhisk-utilities) repository.  The community has agreed that all repositories MUST include ASF LICENSE scanning as part of the Travis Continuous Integration (CI) process enabled to run on every contribution via a GitHub Pull Request (PR).  This means no new or updated files can be merged unless they have a valid ASF LICENSE header where required by policy.

- The Utility itself is here: [scancode](https://github.com/apache/openwhisk-utilities/tree/master/scancode)
- The ASF Compliance configuration is here: [ASF-Release.cfg](https://github.com/apache/openwhisk-utilities/blob/master/scancode/ASF-Release.cfg)

The [README](https://github.com/apache/openwhisk-release/blob/master/README.md) for this repository includes a table that indicates where the scancode utility is invoked, as part of the GitHub Travis CI process, per project repository.

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
$ ./tools/travis/verify_source_code.sh
```

### Apache Tentacles

Although [Apache Tentacles](https://creadur.apache.org/tentacles/) is a tool to check LICENSE file and NOTICE file in artifacts uploading to a staging repository, it is not usable for the Apache OpenWhisk project because it doesn't support the unpacking of tar.gz files.### Known exclusions
