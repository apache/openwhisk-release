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

echo "Verify the remote artifacts with the KEYS"

echo "THIS SCRIPT NEEDS TO BE UPDATED"

exit 1



SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1 $2 $3

rm -rf $OPENWHISK_SVN
mkdir -p $OPENWHISK_SVN/$REMOTE_PATH
cd $OPENWHISK_SVN

# Remove the local folder, because we are about to download the artifacts from the staging folder.
rm -rf $REMOTE_PATH

# Check out the artifacts.
svn co $CURRENT_VERSION_URL $REMOTE_PATH
cd $REMOTE_PATH

import_key_verify_signature $STAGE_URL/KEYS
