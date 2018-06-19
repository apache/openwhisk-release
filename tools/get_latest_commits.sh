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

function get_latest_commit() {
    REPO_URL=$1
    BRANCH=$2
    a=$(git ls-remote $REPO_URL | awk "/$BRANCH/ {print \$1}")
    return $a
}

for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    REPO_KEY=${repo_name//-/_}.repository
    REPO_BRANCH=${repo_name//-/_}.branch
    REPO=$(json_by_key "$CONFIG" $REPO_KEY)
    BRANCH=$(json_by_key "$CONFIG" $REPO_BRANCH)

    if [ "$HASH" != "null" ]; then
        echo "The hash for $repo_name is $HASH"
        hash=$(get_latest_commit $REPO $BRANCH)
        echo "$hash"
    fi
done
