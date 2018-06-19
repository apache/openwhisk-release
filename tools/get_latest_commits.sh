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

for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    REPO_KEY=${repo_name//-/_}.repository
    REPO_BRANCH=${repo_name//-/_}.branch
    REPO=$(json_by_key "$CONFIG" $REPO_KEY)
    BRANCH=$(json_by_key "$CONFIG" $REPO_BRANCH)

    echo "The hash for $repo_name is"
    FULL_HASH=$(git ls-remote $REPO | awk "/$BRANCH/ {print \$1}")
    SHORT_HASH=${FULL_HASH:0:7}
    echo "$SHORT_HASH"
done
