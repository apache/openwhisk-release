#!/bin/bash
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

# This script will download the release candidate artifacts and verify
# they are properly signed and authentic. The script assumes you have
# curl, git, python and gpg already installed and that your gpg is trusted.

# the location providing the rc distribution
RC_DIST=https://dist.apache.org/repos/dist/dev/openwhisk

# the location providing the KEYS
KEYS_DIST=https://dist.apache.org/repos/dist/release/openwhisk

# the artifact being released
NAME=${1?"missing artifact name e.g., openwhisk-client-js"}

# the version of the release artifact
V=${2?"missing version e.g., '3.19.0'"}

# the release candidate, usually 'rc1'
RC=${3:-rc1}

# the last argument is optional and if set to 'cleanup', the script deletes the scratch space at completion
REMOVE_DIR=${4:-cleanup}

# set to non-zero to download the artifacts to verify, this is the default
DL=${DL:-1}

# set to local dir containing artifacts; only used if DL is 0
# LOCAL_DIR=${LOCAL_DIR:-.}

# set to non-zero to import the release keys, this is the default
IMPORT=${IMPORT:-1}

# this is the curl command that will run for fetching files from the web
CURL="curl --fail -s"

# a variable to register errors
ERROR=0

# gpg import regex to parse output
GPG_PROCESSED_REGEX='^.*gpg: Total number processed: +([0-9]+).*$'
GPG_UNCHANGED_REGEX='^.*gpg: +unchanged: +([0-9]+).*$'

# this is the construct name of the artifact
BASE=$NAME-$V
TGZ=$NAME-$V-sources.tar.gz

# this is a constructed name for the keys file
KEYS=$RC-$V-KEYS

NOTICE_REGEX='^Apache .+
Copyright [0-9]{4}-2021 The Apache Software Foundation

This product includes software developed at
The Apache Software Foundation \(http:\/\/www\.apache\.org\/\)\.$'

echo "$(basename $0) (script SHA1: $(gpg --print-md SHA1 $0 | cut -d' ' -f2-))"

DIR=$(mktemp -d)

echo working in the following directory:
echo "$(tput setaf 6)$DIR$(tput sgr0)"

## compares the first two arguments and prints 'passed' if they
## are equal, followed by the fourth argument if it is present;
## if the two arguments are not equal, prints 'failed' and the
## third argument if present
function validate() {
  if [[ $1 == $2 ]]; then
    printf " $(tput setaf 2)passed$(tput sgr0)"
    if [[ $4 != "" ]]; then
      echo " ($4)"
    else
      printf "\n"
    fi
  else
    ERROR=1
    printf " $(tput setaf 1)failed$(tput sgr0)"
    if [[ $3 != "" ]]; then
      echo " ($3)"
    else
      printf "\n"
    fi
  fi
}

## compares the status of a shell command (first arg) to 0
## and prints 'ok' if they match followed by an optional
## third argument, else prints 'error' followed by
## optional second argument and exists the script
function statusok() {
  if [[ $1 -eq 0 ]]; then
    printf " $(tput setaf 2)ok$(tput sgr0)"
    if [[ $3 != "" ]]; then
      echo " ($3)"
    else
      printf "\n"
    fi
  else
    ERROR=1
    printf " $(tput setaf 1)error$(tput sgr0)"
    if [[ $2 != "" ]]; then
      printf "\n$(tput setaf 1)$2$(tput sgr0)"
    else
      printf "\n"
    fi
    finish
  fi
}

function finish() {
  if [[ $ERROR -eq 0 && "$REMOVE_DIR" == "cleanup" ]]; then
    printf "removing the scratch space ($(tput setaf 6)$DIR$(tput sgr0))..."
    rm -rf "$DIR"
    printf " $(tput setaf 2)ok\n$(tput sgr0)"
    exit 0
  else
    echo $(tput setaf 6)
    echo run the following command to remove the scratch space:
    echo "  rm -rf '$DIR'"
    echo $(tput sgr0)
    exit 1
  fi
}

## checks if the rc has a package.json file containing a version field matching the rc
## the first parameter is a path to the file to check e.g., package.json or package-lock.json
## the second parameter is the version to confirm
function packageJsonCheckVersion() {
    PJSON=$1
    EXPECTED_VERSION=$2

    if [ -f "$PJSON" ]; then
        JQ=$(command -v jq)
        if [ "$JQ" != "" ]; then
            PKG_VERSION=$(cat "$PJSON" | $JQ -r .version)
            validate "$PKG_VERSION" "$EXPECTED_VERSION" "expected $EXPECTED_VERSION in '$PJSON'."
        else
            validate 0 1 "jq not found, check that version in '$PJSON' is $EXPECTED_VERSION."
        fi
    else
        validate 0 0 "" "none detected"
    fi
}

function analyzeKeyImport() {
    output=$1
    processed=''
    unchanged=''
    if [[ "$output" =~ $GPG_PROCESSED_REGEX ]]; then
        processed=${BASH_REMATCH[1]}
    fi
    if [[ "$output" =~ $GPG_UNCHANGED_REGEX ]]; then
        unchanged=${BASH_REMATCH[1]}
    fi

    if [[ $processed != '' && $processed == $unchanged ]]; then
        echo "keys already imported (processed $processed unchanged $unchanged)"
    else
        echo "new keys imported (processed $processed unchanged $unchanged)"
    fi
}

function validateNotice() {
    output=$1
    if [[ "$output" =~ $NOTICE_REGEX ]]; then
        printf " $(tput setaf 2)passed$(tput sgr0)\n"
    else
        ERROR=1
        printf " $(tput setaf 1)failed$(tput sgr0)"
        if [[ $2 != "" ]]; then
          echo " ($2)"
        else
          printf "\n"
        fi
    fi
}

if [ $DL -ne 0 ]; then
  SRC=$RC_DIST/$RC
  echo fetching tarball and signatures from $SRC

  printf "fetching $TGZ..."
  RESULT=$($CURL $SRC/$TGZ -o "$DIR/$TGZ" 2>&1)
  statusok $? "$RESULT"

  printf "fetching $TGZ.asc..."
  RESULT=$($CURL $SRC/$TGZ.asc -o "$DIR/$TGZ.asc" 2>&1)
  statusok $? "$RESULT"

  printf "fetching $TGZ.sha512..."
  RESULT=$($CURL $SRC/$TGZ.sha512 -o "$DIR/$TGZ.sha512" 2>&1)
  statusok $? "$RESULT"

  printf "fetching apache license..."
  RESULT=$($CURL https://www.apache.org/licenses/LICENSE-2.0 -o "$DIR/LICENSE-2.0" 2>&1)
  statusok $? "$RESULT"
else
  echo copying from $LOCAL_DIR
  cp "$LOCAL_DIR/$TGZ" "$DIR/$TGZ" || exit 1
  cp "$LOCAL_DIR/$TGZ.asc" "$DIR/$TGZ.asc" || exit 1
  cp "$LOCAL_DIR/$TGZ.sha512" "$DIR/$TGZ.sha512" || exit 1

  printf "fetching apache license..."
  RESULT=$($CURL https://www.apache.org/licenses/LICENSE-2.0 -o "$DIR/LICENSE-2.0" 2>&1)
  statusok $? "$RESULT"
fi

if [ $IMPORT -ne 0 ]; then
  printf "fetching release keys..."
  RESULT=$($CURL $KEYS_DIST/KEYS -s -o "$DIR/$KEYS" 2>&1)
  statusok $? "$RESULT"

  printf "importing keys..."
  RESULT=$(gpg --import "$DIR/$KEYS" 2>&1)
  STATUS=$?
  DELTA=$(analyzeKeyImport "$RESULT")
  statusok $STATUS "$RESULT" "$DELTA"
  if [[ "$DELTA" =~ "new keys imported" ]]; then
      echo "$RESULT"
  fi
fi

printf "unpacking tar ball..."
RESULT=$(tar zxf "$DIR/$TGZ" -C "$DIR" 2>&1)
statusok $? "$RESULT"

printf "cloning scancode..."
RESULT=$(cd "$DIR" && git clone https://github.com/apache/openwhisk-utilities.git --depth 1 2>&1)
statusok $? "$RESULT"

printf "computing sha512 for $TGZ..."
EXPECTED=$(cat "$DIR/$TGZ.sha512")
CMD="cd $DIR && gpg --print-md SHA512 '$TGZ'"
SHA=$(eval $CMD)
statusok $? "$SHA"

echo "$(tput setaf 6)$SHA$(tput sgr0)"
printf "validating sha512..."
validate "$EXPECTED" "$SHA" "$CMD"

printf "verifying asc..."
CMD="gpg --verify '$DIR/$TGZ.asc' '$DIR/$TGZ'"
ASC=$(eval $CMD 2>&1)
STATUS=$?
if [[ $ASC =~ ^.*\"(.*)\".*$ ]]; then
  SIGNER=${BASH_REMATCH[1]}
else
  SIGNER="$(tput setaf 1)???$(tput sgr0)"
fi
validate $STATUS 0 "$CMD" "signed-by: $SIGNER"

printf "verifying notice..."
NOTICE=$(cat "$DIR/$BASE/NOTICE.txt")
validateNotice "$NOTICE" "cat '$DIR/$BASE/NOTICE.txt'"

printf "verifying absence of DISCLAIMER.txt"
CMD="test -f '$DIR/$BASE/DISCLAIMER.txt'"
TEST_DIS=$(eval "$CMD")
validate $? 1 "$CMD"

# If a project bundles any dependencies, there will be additional
# text appended to LICENSE.txt to summarize the additional licenses.
# Therefore only enforce a prefix match between the project's
# LICENSE.txt and the official text of the Apache LICENSE-2.0.
printf "verifying license..."
LICENSE_LEN=$(wc -c "$DIR/LICENSE-2.0" | awk '{print $1}')
CMD="cmp -n $LICENSE_LEN '$DIR/LICENSE-2.0' '$DIR/$BASE/LICENSE.txt'"
CMP=$(eval "$CMD")
validate $? 0 "$CMD"

printf "verifying sources have proper headers..."
if [ -f "$DIR/$BASE/tools/travis/scancodeExclusions" ]; then
    SCANCODE_EXTRA_ARGS="--gitignore '$DIR/$BASE/tools/travis/scancodeExclusions'"
else
    SCANCODE_EXTRA_ARGS=""
fi
CMD="'$DIR/openwhisk-utilities/scancode/scanCode.py' --config '$DIR/openwhisk-utilities/scancode/ASF-Release.cfg' $SCANCODE_EXTRA_ARGS '$DIR/$BASE'"
SC=$(eval $CMD >& /dev/null)
validate $? 0 "$CMD"

printf "scanning for executable files..."
EXE=$(find "$DIR/$BASE" -type f ! -name "*.sh" ! -name "*.sh" ! -name "*.py" ! -name "*.php" ! -name "gradlew" ! -name "gradlew.bat" ! -name "exec" ! -name "wskadmin" ! -name "wskdebug.js" ! -path "*/bin/*" -perm -001)
validate "$EXE" "" "$EXE"

printf "scanning for unexpected file types..."
EXE=$(find "$DIR/$BASE" -type f -and -not -empty -exec file --mime {} \; | grep -v ": text/" | grep -v ": image/" | grep -v ": application/json")
validate "$EXE" "" "$EXE"

printf "scanning for archives..."
EXE=$(find "$DIR/$BASE" -type f -name "*.tar" -name "*.tgz" -o -name "*.gz" -o -name ".zip" -o -name "*.jar")
validate "$EXE" "" "$EXE"

printf "scanning for packages..."
EXE=$(find "$DIR/$BASE" -type d -name "node_modules" -o -name ".gradle" | grep -v tests/dat/actions/nodejs-test)
validate "$EXE" "" "$EXE"

printf "scanning package.json for version match..."
packageJsonCheckVersion "$DIR/$BASE/package.json" $V

printf "scanning package-lock.json for version match..."
packageJsonCheckVersion "$DIR/$BASE/package-lock.json" $V

finish
