#!/usr/bin/env bash

set -e

sudo apt-get install jq

HOMEDIR="$(dirname "$TRAVIS_BUILD_DIR")"
OPENWHISKDIR="$HOMEDIR/openwhisk"
source "$TRAVIS_BUILD_DIR/tools/travis/util.sh"

clone_depth=${1:-"10"}

function git_clone_repo() {
    PROJECT_NAME=$1
    HASH=$2
    git clone --depth $clone_depth https://github.com/apache/$PROJECT_NAME.git $OPENWHISKDIR/$PROJECT_NAME
    cd $OPENWHISKDIR/$PROJECT_NAME
    git reset --hard $HASH
    rm -rf .git
}

rm -rf $OPENWHISKDIR/*

CONFIG=$(read_file $TRAVIS_BUILD_DIR/tools/travis/config.json)
repos=$(echo $(json_by_key "$CONFIG" "RepoList") | sed 's/[][]//g')

for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    HASH_KEY=${repo_name//-/_}.hash
    HASH=$(json_by_key "$CONFIG" $HASH_KEY)
    if [ "$HASH" != "null" ]; then
        echo "The hash for $repo_name is $HASH"
        git_clone_repo $repo_name $HASH
    fi
done
