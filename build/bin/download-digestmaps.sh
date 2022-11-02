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
#download_case ibm-sls 3.4.0 ibmSlsSetup
#download_case ibm-sls 3.4.1 ibmSlsSetup
download_case ibm-sls 3.5.0 ibmSlsSetup

# Truststore Manager
# -----------------------------------------------------------------------------
#download_case ibm-truststore-mgr 1.3.0 ibmTrustStoreMgrSetup

# MAS Core
# -----------------------------------------------------------------------------
#download_case ibm-mas 8.8.0 ibmMasSetup
#download_case ibm-mas 8.8.1 ibmMasSetup
download_case ibm-mas 8.8.2 ibmMasSetup

# MAS Assist
# -----------------------------------------------------------------------------
download_case ibm-mas-assist 8.5.0 ibmMasAssistSetup
download_case ibm-mas-assist 8.5.1 ibmMasAssistSetup

# MAS HP Utilities
# -----------------------------------------------------------------------------
#download_case ibm-mas-hputilities 8.4.0 ibmMasHPUtilitiesSetup

# MAS IoT
# -----------------------------------------------------------------------------
#download_case ibm-mas-iot 8.5.0 ibmMasIotSetup
#download_case ibm-mas-iot 8.5.1 ibmMasIotSetup
download_case ibm-mas-iot 8.5.2 ibmMasIotSetup

# MAS Manage
# -----------------------------------------------------------------------------
#download_case ibm-mas-manage 8.4.0 ibmMasManageSetup
#download_case ibm-mas-manage 8.4.1 ibmMasManageSetup
download_case ibm-mas-manage 8.4.2 ibmMasManageSetup

# MAS Monitor
# -----------------------------------------------------------------------------
#download_case ibm-mas-monitor 8.8.0 ibmMasMonitorSetup
#download_case ibm-mas-monitor 8.8.1 ibmMasMonitorSetup

# MAS Predict
# -----------------------------------------------------------------------------
#download_case ibm-mas-predict 8.6.0 ibmMasPredictSetup
#download_case ibm-mas-predict 8.6.1 ibmMasPredictSetup

# MAS Optimizer
# -----------------------------------------------------------------------------
#download_case ibm-mas-optimizer 8.2.0 ibmMasOptimizerSetup
#download_case ibm-mas-optimizer 8.2.1 ibmMasOptimizerSetup


# MAS Visual Inspection
# -----------------------------------------------------------------------------
#download_case ibm-mas-visualinspection 8.6.0 ibmMasVisualInspectionSetup
#download_case ibm-mas-visualinspection 8.6.1 ibmMasVisualInspectionSetup
