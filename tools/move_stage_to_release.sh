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

echo "Move the remote artifacts from staging to release directory."

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
SVN_USERNAME=$1
SVN_PASSWORD=$2

source "$SCRIPTDIR/load_config.sh" "$SVN_USERNAME" "$SVN_PASSWORD"

if [[ `wget -S --spider $RELEASE_VERSION_URL  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    svn delete $RELEASE_VERSION_URL -m "Removing Apache OpenWhisk release ${full_version}." $CREDENTIALS
fi

if [[ `wget -S --spider $CURRENT_VERSION_URL  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
    svn copy $CURRENT_VERSION_URL $RELEASE_URL -m "Releasing Apache OpenWhisk release ${full_version}." $CREDENTIALS
    if [ "$full_version" != "$version" ]; then
        svn mv $RELEASE_VERSION_URL_STAGE $RELEASE_VERSION_URL -m "Remaning the directory from ${full_version} to ${version}." $CREDENTIALS
    fi
fi
