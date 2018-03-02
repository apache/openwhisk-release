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

# Verify License Compliance

This document describes the work to verify OpenWhisk release artifacts are compliant with ASF licensing policy.

## Policies and rules

As described in [Apache Release Policy](http://www.apache.org/legal/release-policy.html#licensing), every artifact distributed MUST contain only appropriately licensed code per Apache Licensing Policy. It includes two check points:
- Each package MUST provide a LICENSE file and a NOTICE file.
- With a few exceptions, source files consisting of works submitted directly to the ASF by the copyright owner or owner's agent must contain the appropriate ASF license header. Here are the exceptions:
  + Files without any degree of creativity don't require a license header.
  + Sometimes shorter form of ASF license header can be used if the recommended Apache source header is not appropriate.

In OpenWhisk project, we will exclude below type of files from license header verification because of little creativity:
- Json files
- Gradle setting files
- Configuration files prefixed with dot
- Template files used in OpenWhisk installation

In OpenWhisk project, we decided to apply short form of header to minified OpenWhisk action source files in order to get better performance.

## Tools and scripts

[verify_source_code.sh](../tools/verify_source_code.sh) in the `tools` folder is to verify license compliance. [Apache Rat](https://creadur.apache.org/rat/) is used to verify license headers. Files excluded license header verification following the previous rules are configured in the file [pom.xml](../tools/travis/pom.xml).

```
cd $OPENWHISK_SOURCE_DIR
cp $SCRIPTDIR/lib/pom.xml ./
mvn clean apache-rat:check 
```
Below script snippet is used to check LICENSE file and NOTICE file in every repository.
```
for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    echo "Check the repository $repo_name"
    cd $OPENWHISK_CLEANED_SOURCE_DIR/$repo_name && ls {LICENSE*,NOTICE*}
done
```

Although [Apache Tentacles](https://creadur.apache.org/tentacles/) is a tool to check LICENSE file and NOTICE file in artifacts uploading to a staging repository, it is not usable for us because it doesn't support the unpacking of tar.gz files.

## How to

After downloading the source codes to your local disk, run the following script to verify license compliance:
```
$ ./tools/travis/verify_source_code.sh <WORK_DIR>
```
