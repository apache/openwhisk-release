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

echo "Generate release notes and collect change logs of all projects."

WORK_DIR=${1:-"$HOME"}

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1
PARENTDIR="$(dirname "$SCRIPTDIR")"

FILE="$WORK_DIR/releaseNotes.md"
TEMPLATE="$SCRIPTDIR/lib/release_template.md"

# Remove file if exists
if [ -f "$FILE" ] ; then
  rm $FILE
fi

# Read the template
while IFS= read -r aline; do
  printf "%s\n" "$aline" >> $FILE
done <$TEMPLATE

# Print change logs
for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    echo "Collect logs in the repository $repo_name"
    cd $OPENWHISK_SOURCE_DIR/$repo_name

    printf "\n%s\n\n" "## $repo_name" >> $FILE
    git log --pretty=format:"- %s" --date=short | while read line
    do
      PRNUMBER=$(echo $line | egrep -o '\(#[[:digit:]]+\)') # format like (#1234)
      PRN=$(echo $PRNUMBER | egrep -o '[[:digit:]]+') # format like 1234
      PRLINK="([#$PRN](https://github.com/apache/incubator-$repo_name/pull/$PRN))"
      line=${line/$PRNUMBER/$PRLINK}
      printf "%s\n" "$line" >> $FILE
    done
done
