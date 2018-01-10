#!/usr/bin/env bash
echo "Can I sleep 60 mins?"

# Build script for Travis-CI.
#WHISKDIR="$HOMEDIR/incubator-openwhisk"

#cd $WHISKDIR

function parse_yaml {
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\):|\1|" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s=\"%s\"\n", vn, $2, $3);
      }
   }'
}

cd $TRAVIS_BUILD_DIR/tools/travis
parse_yaml test.yaml
eval $(parse_yaml test.yaml)
echo $output_file

#HOMEDIR="$(dirname "$TRAVIS_BUILD_DIR")"
#cd $HOMEDIR

# Build script for Travis-CI.
#WHISKDIR="$HOMEDIR/incubator-openwhisk"

#cd $WHISKDIR
#ls

#echo "load images in build"
#if [[ -e ~/docker/image.tar ]]; then docker load -i ~/docker/image.tar; fi

echo "list images in build"
docker images