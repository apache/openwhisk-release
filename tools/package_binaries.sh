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

echo "Package the binaries."

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1 $2 $3

for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    # Build the binaries
    BINARIES=${repo_name//-/_}.binaries
    PUBLISH_BINARIES=$(json_by_key "$CONFIG" $BINARIES)
    if [ "$PUBLISH_BINARIES" == "yes" ] ; then
        cd $OPENWHISK_SOURCE_DIR/$repo_name
        ./gradlew releaseBinaries -PpackageVersion=${version}
        # Copy all the binary artifacts into the directory ${CURRENT_VERSION_DIR}
        cp -r release/. ${CURRENT_VERSION_DIR}/
    fi
done
