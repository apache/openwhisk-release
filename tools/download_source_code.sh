#!/usr/bin/env bash

set -e

WORK_DIR=${1:-"$HOME"}

SCRIPTDIR="$(cd $(dirname "$0")/ && pwd)"
source "$SCRIPTDIR/load_config.sh" $1

clone_depth=${2:-"100"}

function git_clone_repo() {
    PROJECT_NAME=$1
    HASH=$2
    REPO=$3
    BRANCH=$4
    git clone --depth $clone_depth -b $BRANCH $REPO $OPENWHISK_SOURCE_DIR/$PROJECT_NAME
    cd $OPENWHISK_SOURCE_DIR/$PROJECT_NAME
    git reset --hard $HASH
    rm -rf .git
}

rm -rf $OPENWHISK_SOURCE_DIR/*

CONFIG=$(read_file $SCRIPTDIR/config.json)
repos=$(echo $(json_by_key "$CONFIG" "RepoList") | sed 's/[][]//g')

for repo in $(echo $repos | sed "s/,/ /g")
do
    repo_name=$(echo "$repo" | sed -e 's/^"//' -e 's/"$//')
    HASH_KEY=${repo_name//-/_}.hash
    REPO_KEY=${repo_name//-/_}.repository
    REPO_BRANCH=${repo_name//-/_}.branch
    HASH=$(json_by_key "$CONFIG" $HASH_KEY)
    REPO=$(json_by_key "$CONFIG" $REPO_KEY)
    BRANCH=$(json_by_key "$CONFIG" $REPO_BRANCH)
    if [ "$HASH" != "null" ]; then
        echo "The hash for $repo_name is $HASH"
        git_clone_repo $repo_name $HASH $REPO $BRANCH
    fi
done
