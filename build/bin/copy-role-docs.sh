#!/bin/bash

SRC_DIR=$GITHUB_WORKSPACE/ibm/mas_airgap/roles
TO_DIR=$GITHUB_WORKSPACE/docs/roles

mkdir -p $TO_DIR

function copyDoc() {
  ROLE=$1
  cp $SRC_DIR/$ROLE/README.md $TO_DIR/$ROLE.md
}

copyDoc case_mirror
copyDoc case_prepare
copyDoc catalogs
copyDoc ocp_contentsourcepolicy
copyDoc registry
copyDoc thirdparty_mirror
