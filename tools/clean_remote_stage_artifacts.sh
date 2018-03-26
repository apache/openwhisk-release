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

echo "Clean the remote artifacts in staging directory"

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
WORK_DIR=${1:-"$HOME"}
SVN_USERNAME=$2
SVN_PASSWORD=$3

source "$SCRIPTDIR/load_config.sh" "$WORK_DIR" "$SVN_USERNAME" "$SVN_PASSWORD"

if [[ `wget -S --spider $CURRENT_VERSION_URL  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    svn delete $CURRENT_VERSION_URL -m "Removing Apache OpenWhisk release ${full_version} from staging." $CREDENTIALS
fi
