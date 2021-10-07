# MAS Playbooks

## Install Suite
Before you use this playbook you will likely want to edit the `mas_config` variable to supply your own configurtation, instead of the sample data provided.

### Required environment variables
- `MAS_INSTANCE_ID` Declare the instance ID for the MAS install
- `MAS_ENTITLEMENT_KEY` Provide your IBM entitlement key
- `MAS_CONFIG_DIR` Directory where generated config files will be saved (you may also provide pre-generated config files here)


### Additional AirGap Install environment variables
- `AIRGAP_INSTALL` - flag to enable airgap install
- `MAS_CASE_BUNDLE_DIR` - the location of the CASE bundle to be installed
- `CP_ICR_ENTITLEMENT_KEY` to mirror images from ICR - lookup your entitlement key from the [IBM Container Library](https://myibm.ibm.com/products-services/containerlibrary)
- `MAS_CATALOG_IMG` - a digest reference to the MAS catalog image
- `TM_CATALOG_IMG` -  digest reference to the Trustore Manager catalog image

### Optional environment variables
- `MAS_CATALOG_SOURCE` Set to `ibm-mas-operators` if you want to deploy pre-release development builds
- `MAS_CHANNEL` Override the default release channel (8.x)
- `MAS_DOMAIN` Override the default generated domain for the MAS installation
- `MAS_ICR_CP` Override the registry source for all container images deployed by the MAS operator
- `MAS_ICR_CPOPEN` Override the registry source for all container images deployed by the MAS operator
- `MAS_ENTITLEMENT_USERNAME` Override the default entitlement username (cp)


### Example
```bash
# Fyre credentials
export FYRE_USERNAME=xxx
export FYRE_APIKEY=xxx
export FYRE_PRODUCT_ID=225
# Cluster configuration
export CLUSTER_NAME=xxx
export OCP_VERSION=4.6.38

# MAS configuration
export MAS_INSTANCE_ID=xxx
export MAS_ENTITLEMENT_KEY=xxx

export MAS_CONFIG_DIR=~/masconfig

# Airgap config
export AIRGAP_INSTALL=true
export MAS_CASE_BUNDLE_DIR=XXX/ibm-mas-case/stable/ibm-mas-bundle/
export MAS_CATALOG_IMG=icr.io/cpopen/ibm-mas-operator-catalog@sha256:822e4840748737a012a94997c202eeb160107dc5adb7c2a40d42aa087ceb41b1
export TM_CATALOG_IMG=icr.io/cpopen/ibm-truststore-mgr-operator-catalog@sha256:56d5af1b31637c318edef4522d4bd215425ac43a4fe0056adac504577ca21f3e
export CP_ICR_ENTITLEMENT_KEY=XXX

ansible-playbook playbooks/mas/install-mas.yml
```

