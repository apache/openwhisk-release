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

# the location providing the distribution
DIST=https://dist.apache.org/repos/dist/dev/incubator/openwhisk

# the artifact being released
NAME=${1?"missing artifact name e.g., openwhisk-client-js"}

# the name of the podling (to match what is in the disclaimer file)
DESCRIPTION=${2?"missing podling description e.g., 'OpenWhisk JavaScript Client Library'"}

# the version of the release artifact
V=${3?"missing version e.g., '3.19.0-incubating'"}

# the release candidate, usualy 'rc1'
RC=${4:-rc1}

# set to non-zero to download the artifacts to verify, this is the default
DL=${DL:-1}

# set to non-zero to import the release keys, this is the default
IMPORT=${IMPORT:-1}

# this is the construct name of the artifact
BASE=incubator-$NAME-$V
TGZ=$NAME-$V-sources.tar.gz

# this is a constructed name for the keys file
KEYS=$RC-$V-KEYS

DISCLAIMER="Apache $DESCRIPTION is an effort undergoing incubation at The Apache Software Foundation (ASF), sponsored by the Apache Incubator. Incubation is required of all newly accepted projects until a further review indicates that the infrastructure, communications, and decision making process have stabilized in a manner consistent with other successful ASF projects. While incubation status is not necessarily a reflection of the completeness or stability of the code, it does indicate that the project has yet to be fully endorsed by the ASF."

NOTICE=$(cat << END
Apache $DESCRIPTION
Copyright 2016-2019 The Apache Software Foundation

This product includes software developed at
The Apache Software Foundation (http://www.apache.org/).
END
)

echo "$(basename $0) (script SHA1: $(gpg --print-md SHA1 $0 | cut -d' ' -f2-))"

DIR=$(mktemp -d)

echo working in the following directory:
echo "$(tput setaf 6)$DIR$(tput sgr0)"

if [ $DL -ne 0 ]; then
  echo fetching $TGZ
  curl $DIST/apache-openwhisk-$V-$RC/$TGZ -s -o "$DIR/$TGZ"

  echo fetching $TGZ.asc
  curl $DIST/apache-openwhisk-$V-$RC/$TGZ.asc -s -o "$DIR/$TGZ.asc"

  echo fetching $TGZ.sha512
  curl $DIST/apache-openwhisk-$V-$RC/$TGZ.sha512 -s -o "$DIR/$TGZ.sha512"
fi

if [ $IMPORT -ne 0 ]; then
  echo fetching release keys
  curl $DIST/KEYS -s -o "$DIR/$KEYS"

  echo importing keys
  gpg --import "$DIR/$KEYS"
fi

function validate() {
  if [[ $1 == $2 ]]; then
    printf " $(tput setaf 2)passed$(tput sgr0)"
    if [[ $4 != "" ]]; then
      echo " ($4)"
    else
      printf "\n"
    fi
  else
    printf " $(tput setaf 1)failed$(tput sgr0)"
    if [[ $3 != "" ]]; then
      echo " ($3)"
    else
      printf "\n"
    fi
  fi
}

echo "unpacking tar ball"
tar zxf "$DIR/$TGZ" -C "$DIR"

echo "cloning scancode"
cd "$DIR" && git clone https://github.com/apache/incubator-openwhisk-utilities.git --depth 1

echo "computing sha512 for $TGZ"
EXPECTED=$(cat "$DIR/$TGZ.sha512")
CMD="cd $DIR && gpg --print-md SHA512 '$TGZ'"
SHA=$(eval $CMD)
echo "SHA512: $(tput setaf 6)$SHA$(tput sgr0)"
printf "validating sha512..."
validate "$EXPECTED" "$SHA" "$CMD"

printf "verifying asc..."  
CMD="gpg --verify '$DIR/$TGZ.asc' '$DIR/$TGZ'"
ASC=$(eval $CMD 2>&1)
RES=$?
if [[ $ASC =~ ^.*\"(.*)\".*$ ]]; then
  SIGNER=${BASH_REMATCH[1]}
else
  SIGNER="$(tput setaf 1)???$(tput sgr0)"
fi
validate $RES 0 "$CMD" "signed-by: $SIGNER"

printf "verifying disclaimer..."
DTXT=$(cat "$DIR/$BASE/DISCLAIMER.txt")
validate "$DISCLAIMER" "$DTXT" "cat '$DIR/$BASE/DISCLAIMER.txt'"

printf "verifing notice..."
NTXT=$(cat "$DIR/$BASE/NOTICE.txt")
validate "$NOTICE" "$NTXT" "cat '$DIR/$BASE/NOTICE.txt'"

printf "verifying license..."
curl http://www.apache.org/licenses/LICENSE-2.0 -s -o "$DIR/LICENSE-2.0"
## this is a more forgiving license check that allows for the copyright line to be filled out
#CMD="diff '$DIR/$BASE/LICENSE.txt' '$DIR/LICENSE-2.0' -I '^   Copyright'"
CMD="diff '$DIR/$BASE/LICENSE.txt' '$DIR/LICENSE-2.0'"
DIF=$(eval "$CMD")
validate $? 0 "$CMD"

printf "verifying sources have proper headers..."
CMD="'$DIR/incubator-openwhisk-utilities/scancode/scanCode.py' --config '$DIR/incubator-openwhisk-utilities/scancode/ASF-Release.cfg' '$DIR/$BASE'"
SC=$(eval $CMD >& /dev/null)
validate $? 0 "$CMD"

printf "scanning for executable files..."
EXE=$(find "$DIR/$BASE" -type f ! -name "*.sh" ! -name "*.sh" ! -name "*.py" ! -name "*.php" ! -name "gradlew" ! -name "gradlew.bat" ! -path "*/bin/*" -perm -001)
validate "$EXE" "" "$EXE"

printf "scanning for archives..."
EXE=$(find "$DIR/$BASE" -type f -name "*.tar" -name "*.tgz" -o -name "*.gz" -o -name ".zip" -o -name "*.jar")
validate "$EXE" "" "$EXE"

printf "scanning for packages..."
EXE=$(find "$DIR/$BASE" -type d -name "node_modules" -o -name ".gradle")
validate "$EXE" "" "$EXE"

echo $(tput setaf 6)
echo run the following command to remove the scratch space:
echo "  rm -rf '$DIR'"
echo $(tput sgr0)
