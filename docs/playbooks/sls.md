# SLS Playbooks

## Install sls
Before you use this playbook you will likely want to edit the `mas_config_dir` variable to supply your own configuration, instead of the sample data provided.

### Airgap environment variables
These variables are required to mirror images to the cluster before installation
- `CLUSTER_NAME` the name for the target installation cluster
- `FYRE_USERNAME` a user name with access to the fyre api to login to the cluster
- `FYRE_APIKEY` an apikey with access to the fyre api to login to the cluster
- `SLS_CASE_BUNDLE_DIR` a directory to store the SLS Case bundle
- `SLS_CATALOG_SOURCE` Set to `ibm-sls-operators` to use the airgap catalog
### Required environment variables
- `SLS_ENTITLEMENT_KEY` Provide your IBM entitlement key

### Optional environment variables

- `SLS_CHANNEL` Override the default release channel (3.x)
- `SLS_ICR_CP` Override the registry source for all container images deployed by the SLS operator
- `SLS_ICR_CPOPEN` Override the registry source for all container images deployed by the SLS operator
- `SLS_ENTITLEMENT_USERNAME` Override the default entitlement username (cp)
- `SLS_NAMESPACE` Override the default entitlement username (ibm-sls)
- `SLS_STORAGE_CLASS` Defines Storage Class to be used by SLS Persistent Volumes
- `SLS_LICENSE_ID` Must be set to the license id specified in the license file when one is provided
- `SLS_REGISTRATION_KEY` optional var when you want to install sls using a registration key you have.

- `MAS_INSTANCE_ID` - if specified, a SLSCfg for MAS will be generated
- `MAS_CONFIG_DIR` - if specified, a SLSCfg for MAS will be generated in this directory

### Example usage: release build

```bash
export SLS_INSTANCE_ID=xxx
export SLS_ENTITLEMENT_KEY=xxx
export SLS_STORAGE_CLASS=xxx

ansible-playbook playbooks/sls/install-sls.yml
```

!!! note
    Lookup your entitlement key from the [IBM Container Library](https://myibm.ibm.com/products-services/containerlibrary)
