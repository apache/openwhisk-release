#!/usr/bin/env bash
SUFFIX="$TRAVIS_BUILD_NUMBER"
PR_NUM="$TRAVIS_PULL_REQUEST"

mkdir -p ~/docker
cd ~/docker
ls
rm *.tar
