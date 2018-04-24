#!/bin/bash -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR/shell-helpers.sh"

echo '//registry.npmjs.org/:_authToken=${NPM_PUBLISH_TOKEN}' > .npmrc

PACKAGE_VERSION_JSON=package.json
PACKAGE_VERSION_NPM=@bundlesize/bundlesize

jq ".version=\"$VERSION_TO_PUBLISH\"" $PACKAGE_VERSION_JSON > $PACKAGE_VERSION_JSON.tmp
mv $PACKAGE_VERSION_JSON.tmp $PACKAGE_VERSION_JSON

cat $PACKAGE_VERSION_JSON

#run "npm publish --access public"
