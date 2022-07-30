#!/bin/bash

# We can't access the image maps from the case bundles at install time, because we're likely running in
# and environment with limited connectivity, so everything needs to be self-contained.
#
# Soon, we will improve our airgap implemention to not need these seperate digests, they were a
# tactical solution to accelerate airgap delivery.

function download_case() {
  case_name=$1
  case_version=$2
  inventory_name=$3

  mkdir -p downloads
  if [[ ! -e "downloads/${case_name}-${case_version}.tgz" ]]; then
    wget -k https://github.com/IBM/cloud-pak/blob/master/repo/case/${case_name}/${case_version}/${case_name}-${case_version}.tgz?raw=true -O downloads/${case_name}-${case_version}.tgz
  fi

  mkdir -p digests/${case_name}
  tar -xvf downloads/${case_name}-${case_version}.tgz -C digests/${case_name} ${case_name}/inventory/${inventory_name}/files/image-map.yaml --strip-components 4
  mv digests/${case_name}/image-map.yaml digests/${case_name}/${case_version}.yaml
}

# SLS
# -----------------------------------------------------------------------------
download_case ibm-sls 3.4.0 ibmSlsSetup

# Truststore Manager
# -----------------------------------------------------------------------------
download_case ibm-truststore-mgr 1.3.0 ibmTrustStoreMgrSetup

# MAS Core
# -----------------------------------------------------------------------------
download_case ibm-mas 8.8.0 ibmMasSetup

# MAS IoT
# -----------------------------------------------------------------------------
download_case ibm-mas-iot 8.5.0 ibmMasIotSetup

# MAS Manage
# -----------------------------------------------------------------------------
download_case ibm-mas-manage 8.4.0 ibmMasManageSetup
