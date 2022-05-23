#!/bin/bash
set -e

if [ "$DEV_MODE" != "true" ]; then
  source ${GITHUB_WORKSPACE}/build/bin/.env.sh
  source ${GITHUB_WORKSPACE}/build/bin/.functions.sh
  install_yq
fi

yq -yi ".version=\"${VERSION}\"" $GITHUB_WORKSPACE/ibm/mas_airgap/galaxy.yml

cat $GITHUB_WORKSPACE/ibm/mas_airgap/galaxy.yml

cd $GITHUB_WORKSPACE/ibm/mas_airgap
ansible-galaxy collection build

cd $GITHUB_WORKSPACE
