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

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"

CURRENTDIR="$(cd $(dirname "$0")/ && pwd)"
PARENTDIR="$(dirname "$CURRENTDIR")"

OPENWHISK_WORKING_AREA="$PARENTDIR/stagingArea"
OPENWHISK_SOURCE_DIR="$OPENWHISK_WORKING_AREA/sources"
OPENWHISK_CLEANED_SOURCE_DIR="$OPENWHISK_WORKING_AREA/cleaned_sources"
OPENWHISK_ARTIFACT_DIR="$OPENWHISK_WORKING_AREA/artifacts"

STAGE_URL="https://dist.apache.org/repos/dist/dev/openwhisk"
STAGE_SVN_DIR="$OPENWHISK_WORKING_AREA/svn_staging"
RELEASE_URL="https://dist.apache.org/repos/dist/release/openwhisk"
RELEASE_SVN_DIR="$OPENWHISK_WORKING_AREA/svn_release"

source "$SCRIPTDIR/util.sh"

CONFIG=$(read_file $SCRIPTDIR/config.json)

repos=$(echo $(json_by_key "$CONFIG" "RepoList") | sed 's/[][]//g')

version_key="versioning"
version_json=$(json_by_key "$CONFIG" ${version_key}.version)
version=${5:-"$version_json"}
pre_release_version=$(json_by_key "$CONFIG" ${version_key}.pre_release_version)
full_version=$version_json

if [ ! -z "$pre_release_version" ]; then
    pre_release_version_no_space="$(echo -e "${pre_release_version}" | tr -d '[[:space:]]')"
    if [ ! -z "$pre_release_version_no_space" ]; then
        full_version=$full_version-$pre_release_version_no_space
    fi
fi
