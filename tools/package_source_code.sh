#!/usr/bin/env bash
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

set -e

echo "Package the artifacts."

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1

mkdir -p $OPENWHISK_ARTIFACT_DIR
rm -rf $OPENWHISK_ARTIFACT_DIR/*

mkdir -p $OPENWHISK_CLEANED_SOURCE_DIR
rm -rf $OPENWHISK_CLEANED_SOURCE_DIR/*

# Clean up all the source code by excluding unnecessary files and folders
# Remove hidden files and folder
# Remove bin and build folders
rsync -rtp --exclude gradle/wrapper/gradle-\*.jar --exclude .bin --exclude .jshintrc --exclude .pydevproject --exclude .rat-excludes --exclude .git\* --exclude .travis.yml --exclude credentials.json.enc --exclude build --exclude specification/archive --exclude specification/diagrams --exclude "*.odg" --exclude tests/src/integration $OPENWHISK_SOURCE_DIR/. $OPENWHISK_CLEANED_SOURCE_DIR

for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    project_name="$repo_name"
    rm -rf $OPENWHISK_CLEANED_SOURCE_DIR/$project_name/.git
    cd $OPENWHISK_CLEANED_SOURCE_DIR
    # Rename the directory by adding the version number
    mv $project_name $project_name-$version
    tar czf ${OPENWHISK_ARTIFACT_DIR}/${repo_name}-${version}-sources.tar.gz $project_name-$version
done
