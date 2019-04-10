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

echo "Checkout the SVN to the local directory."

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1 $2

: ${OPENWHISK_SVN?"Need is not set OPENWHISK_SVN"}

if [[ `wget -S --spider $CURRENT_VERSION_URL  2>&1 | grep 'HTTP/1.1 404 Not Found'` ]]; then
    # Create an empty folder named ${REMOTE_PATH} in the remote staging folder
    svn mkdir -m "Create the directory for ${full_version} in staging." $CURRENT_VERSION_URL $CREDENTIALS
fi

# Create a subversion directory for openwhisk to stage all the packages
rm -rf $OPENWHISK_SVN
mkdir -p $OPENWHISK_SVN
rm -rf $OPENWHISK_SVN/*

cd $OPENWHISK_SVN

# Make sure the folder $REMOTE_PATH is connected to the svn staging server.
CMD="svn co $CURRENT_VERSION_URL $REMOTE_PATH"
echo $CMD
$CMD
echo svn repo checked out to... $OPENWHISK_SVN
