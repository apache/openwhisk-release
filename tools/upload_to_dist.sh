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

echo "Performing svn add in dist for each artifact in $pre_release_version."

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1

cd "$STAGE_SVN_DIR"
svn update

cd "$RELEASE_SVN_DIR"
svn update

cd "$RELEASE_SVN_DIR"

for artifact in `find "$STAGE_SVN_DIR/$pre_release_version" -name "*${version}*"`; do
    artifact=$(basename -- "$artifact")
    cp "$STAGE_SVN_DIR/$pre_release_version/$artifact" $artifact
    svn add $artifact
done
