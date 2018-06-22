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

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh"

clone_depth=${1:-"100"}

function git_clone_repo() {
    PROJECT_NAME=$1
    HASH=$2
    REPO=$3
    BRANCH=$4
    git clone --depth $clone_depth -b $BRANCH $REPO $OPENWHISK_SOURCE_DIR/$PROJECT_NAME
    cd $OPENWHISK_SOURCE_DIR/$PROJECT_NAME
    git reset --hard $HASH
    #rm -rf .git
}

rm -rf $OPENWHISK_SOURCE_DIR/*

for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    HASH_KEY=${repo_name//-/_}.hash
    REPO_KEY=${repo_name//-/_}.repository
    REPO_BRANCH=${repo_name//-/_}.branch
    HASH=$(json_by_key "$CONFIG" $HASH_KEY)
    REPO=$(json_by_key "$CONFIG" $REPO_KEY)
    BRANCH=$(json_by_key "$CONFIG" $REPO_BRANCH)
    project_name="incubator-$repo_name"
    if [ "$HASH" != "null" ]; then
        echo "The hash for $project_name is $HASH"
        git_clone_repo $project_name $HASH $REPO $BRANCH
    fi
done
