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

echo "Upload release candidates to staging."

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1

cd "$STAGE_SVN_DIR"

svn update

if [ ! -d "$pre_release_version" ]; then
    mkdir "$pre_release_version"
    svn add --force "$pre_release_version"
fi

cd "$pre_release_version"

for artifact in `ls "$OPENWHISK_ARTIFACT_DIR"`; do
    mv "$OPENWHISK_ARTIFACT_DIR"/$artifact $artifact
    svn add --force $artifact
done

svn commit -m "Staging Apache OpenWhisk release candidates from $1."
