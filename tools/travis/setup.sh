#!/usr/bin/env bash
echo "hello openwhisk release"

# Define the parent directory of TRAVIS_BUILD_DIR(the directory of the current repository) as HOMEDIR
HOMEDIR="$(dirname "$TRAVIS_BUILD_DIR")"
OPENWHISKDIR="$HOMEDIR/openwhisk"
export OPENWHISK_HOME="$OPENWHISKDIR/incubator-openwhisk";

#function clone_repo {
#}

# Clone the OpenWhisk code

# TO do: clone all the repos to be released based on a commit hash
# All the source code is going to be put under the directory $HOMEDIR/openwhisk
mkdir -p $OPENWHISKDIR
cd $OPENWHISKDIR

echo "list images in setup before build"
docker images

# Download the openwhisk core components.
git clone --depth 10 https://github.com/apache/incubator-openwhisk.git
cd incubator-openwhisk
git reset --hard 3fdea43
cd ..

# Download the openwhisk catalog.
git clone --depth 10 https://github.com/apache/incubator-openwhisk-catalog.git
cd incubator-openwhisk-catalog
git reset --hard ad24d4c
cd ..

# Download the openwhisk runtime nodejs.
git clone https://github.com/apache/incubator-openwhisk-runtime-nodejs.git
cd incubator-openwhisk-runtime-nodejs
git reset --hard 1c6c5db
cd ..

# Download the openwhisk CLI.
git clone https://github.com/apache/incubator-openwhisk-cli.git
cd incubator-openwhisk-cli
git reset --hard 7b78091
cd ..

# To do: build the invoker, controller, runtime images, etc.
# Build the core openwhisk.
cd $OPENWHISKDIR/incubator-openwhisk
#./gradlew core:controller:distDocker
#./gradlew core:invoker:distDocker

# Build the runtime nodejs.
cd $OPENWHISKDIR/incubator-openwhisk-runtime-nodejs
#./gradlew core:nodejs6Action:distDocker

# Build the CLI binaries.
cd $OPENWHISKDIR/incubator-openwhisk-cli
#./gradlew buildBinaries -PcrossCompileCLI=true

# To do: build the source code in one docker image
cd $OPENWHISKDIR
ls

# Generate Dockerfile
echo "FROM scratch" >> Dockerfile
echo "ADD . /openwhisk" >> Dockerfile
docker build --rm=false -t houshengbo/sourcecode .

# To do: save all the images in the cache directory ~/docker/.


echo "$TRAVIS_BUILD_DIR"
echo "$HOMEDIR"

echo "load images in setup"
if [[ -e ~/docker/image.tar ]]; then docker load -i ~/docker/image.tar; fi

echo "list images in setup"
docker images

echo "build the image"
cd $TRAVIS_BUILD_DIR
docker build --rm=false -t houshengbo/test .

# Build script for Travis-CI.
WHISKDIR="$HOMEDIR/incubator-openwhisk"

cd $WHISKDIR
#./gradlew distDocker




mkdir -p ~/docker; docker save houshengbo/test > ~/docker/image.tar
echo "cache images here"

#./tools/travis/setup.sh

#ANSIBLE_CMD="ansible-playbook -i environments/local -e docker_image_prefix=testing"
#TERM=dumb ./gradlew distDocker -PdockerImagePrefix=testing

#cd $WHISKDIR/ansible
#$ANSIBLE_CMD setup.yml
#$ANSIBLE_CMD prereq.yml
#$ANSIBLE_CMD couchdb.yml
#$ANSIBLE_CMD initdb.yml
#$ANSIBLE_CMD apigateway.yml

#cd $TRAVIS_BUILD_DIR
#TERM=dumb ./gradlew buildBinaries

#cd $WHISKDIR/ansible
#$ANSIBLE_CMD wipe.yml
#$ANSIBLE_CMD openwhisk.yml
