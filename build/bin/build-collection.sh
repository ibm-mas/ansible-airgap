#!/bin/bash
set -e

if [ "$DEV_MODE" != "true" ]; then
  source ${TRAVIS_BUILD_DIR}/build/bin/.env.sh
  source ${TRAVIS_BUILD_DIR}/build/bin/.functions.sh
  install_yq
fi

yq -yi ".version=\"${VERSION}\"" $TRAVIS_BUILD_DIR/ibm/mas_airgap/galaxy.yml

cat $TRAVIS_BUILD_DIR/ibm/mas_airgap/galaxy.yml

cd $TRAVIS_BUILD_DIR/ibm/mas_airgap
ansible-galaxy collection build

cd $TRAVIS_BUILD_DIR
