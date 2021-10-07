# MAS Core Service on DevIT Quickburn

This master playbook will drive the following playbooks in sequence:

- [Provision & setup Quickburn](ocp.md#quickburn) (50 minutes)
- Install dependencies:
    - Install MongoDb (coming soon)
    - [Install SLS](sls.md#install-sls)(20 minutes)
- Install & configure MAS:
    - [Install & configure MAS](mas.md#install-mas) (60 minutes)

All timings are estimates and rely on network transfer rates for mirroring container images, see the individual pages for each of these playbooks for more information.  

## Required environment variables
- `FYRE_USERNAME`
- `FYRE_APIKEY`
- `FYRE_PRODUCT_ID`
- `CLUSTER_NAME`
- `CLUSTER_URL`
- `OCP_VERSION`
- `MAS_INSTANCE_ID` Declare the instance ID for the MAS install
- `MAS_ENTITLEMENT_KEY` Lookup your entitlement key from the [IBM Container Library](https://myibm.ibm.com/products-services/containerlibrary)
- `SLS_ENTITLEMENT_KEY` Lntitlement to access SLS.
- `MAS_CONFIG_DIR` Directory where generated config files will be saved (you may also provide pre-generated config files here)
**Airgap specifics**
- `MAS_CASE_BUNDLE_DIR`
- `SLS_CASE_BUNDLE_DIR`
- `MAS_CATALOG_SOURCE` Set to "ibm-mas-operators" to override the use of the IBM Operator Catalog as the catalog source
- `SLS_CATALOG_SOURCE` Set to "ibm-sls-operators" to override the use of the IBM Operator Catalog as the catalog source
- `MAS_CATALOG_IMG` se
- `TM_CATALOG_IMG` se
**Entitlements to mirror container images**
- `CP_ICR_ENTITLEMENT_KEY`
- `REDHAT_IO_USER`
- `REDHAT_IO_ENTITLEMENT_KEY`
- `QUAY_IO_USER` 
- `QUAY_IO_ENTITLEMENT_KEY`
**SLS Licensing configuration**
- `SLS_LICENSE_ID`
- `SLS_REGISTRATION_KEY`

## Optional environment variables
- `FYRE_CLUSTER_SIZE`
- `W3_USERNAME` to enable access to pre-release development builds of MAS
- `ARTIFACTORY_APIKEY`  to enable access to pre-release development builds of MAS
- `MAS_CHANNEL` to override the use of the `8.x` channel
- `MAS_DOMAIN` to set a custom domain for the MAS installation
- `MAS_ICR_CP` to override the value MAS uses for the IBM Entitled Registry (`cp.icr.io/cp`)
- `MAS_ICR_CPOPEN` to override the value MAS uses for the IBM Open Registry (`icr.io/cpopen`)
- `MAS_ENTITLEMENT_USERNAME` to override the username MAS uses to access content in the IBM Entitled Registry
- `CIS_CRN` to enable integration with IBM Cloud Internet Services (CIS) for DNS & certificate management
- `CIS_SUBDOMAIN` if you want to use a subdomain within your CIS instance

!!! tip
    `MAS_ICR_CP`, `MAS_ICR_CPOPEN`, & `MAS_ENTITLEMENT_USERNAME` are primarily used when working with pre-release builds in conjunction with `W3_USERNAME`, `ARTIFACTORY_APIKEY` and the `MAS_CATALOG_SOURCE` environment variables.


## Example configuration

```bash
  
# Cluster configuration
export CLUSTER_NAME=airgapinstall
export CLUSTER_URL=apps.airgap_install.cp.fyre.ibm.com
export OCP_VERSION=4.6.31
export FYRE_PRODUCT_ID=225
# Fyre credentials
export FYRE_USERNAME=XXX@XX.ibm.com
export FYRE_APIKEY=XXXXXX
# MAS CASE details
export MAS_CASE_BUNDLE_DIR=~/ibm-mas-bundle/
# MAS configuration
export MAS_INSTANCE_ID=airgapinstall
export W3_USERNAME=XXX@XX.ibm.com
export MAS_ENTITLEMENT_USERNAME=$W3_USERNAME
export ARTIFACTORY_APIKEY=XXXX
export MAS_ENTITLEMENT_KEY=$ARTIFACTORY_APIKEY
# Enable Airgap Installation, without this the script will not change
export AIRGAP_INSTALL=true

export CP_ICR_ENTITLEMENT_KEY=XXX

export REDHAT_IO_USER=XXX@XX.ibm.com
export REDHAT_IO_ENTITLEMENT_KEY=XXXX

export MAS_CATALOG_SOURCE=ibm-mas-operators
export MAS_CATALOG_IMG=icr.io/cpopen/ibm-mas-operator-catalog@sha256:XXDIGESTXX
export TM_CATALOG_IMG=icr.io/cpopen/ibm-truststore-mgr-operator-catalog@sha256:XXDIGESTXX
export QUAY_IO_USER=XXXX
export QUAY_IO_ENTITLEMENT_KEY=XXXX

export MAS_CONFIG_DIR=~/devops-configs/config/

# SLS CASE details
export SLS_CASE_BUNDLE_DIR=~/ibm-sls-bundle/
export SLS_ENTITLEMENT_KEY=$MAS_ENTITLEMENT_KEY
export SLS_CATALOG_SOURCE=ibm-sls-operator-catalog
# SLS config
export SLS_LICENSE_ID=XXXX
export SLS_REGISTRATION_KEY=XXXX


ansible-playbook ~/.ansible/collections/ansible_collections/ibm/mas_airgap/playbooks/fullstack-quickburn.yml
```

!!! note
    Lookup your entitlement keys from the [IBM Container Library](https://myibm.ibm.com/products-services/containerlibrary)

