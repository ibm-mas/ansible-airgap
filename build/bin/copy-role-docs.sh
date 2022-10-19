#!/bin/bash

SRC_DIR=$GITHUB_WORKSPACE/ibm/mas_airgap/roles
TO_DIR=$GITHUB_WORKSPACE/docs/roles

mkdir -p $TO_DIR

function copyDoc() {
  ROLE=$1
  cp $SRC_DIR/$ROLE/README.md $TO_DIR/$ROLE.md
}

copyDoc install_digest_cm
copyDoc mirror_case_prepare
copyDoc mirror_extras_prepare
copyDoc mirror_images
copyDoc ocp_contentsourcepolicy
copyDoc ocp_operators_mirror
copyDoc ocp_release_mirror
copyDoc registry
copyDoc simulate_network
