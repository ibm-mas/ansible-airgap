case_mirror
==================

This role uses the specifed CASE bundle to mirror container images to a mirror registry and configure the cluster to pull images from this mirror.

**!!! IMPORTANT**
The contents of the directory specified by $DEV_AIRGAP_CHANGES are copied over the $CASE_BUNDLE_DIR, so the sub-directory structure of the two should match. e.g.

```bash
$ tree $DEV_AIRGAP_CHANGES
/Users/paulstone/GitHub/ibm-mas-case/dev-airgap-changes
├── archive
│   ├── ibm-mas-8.5.0-pre.issue-7078a-test-images.csv
│   └── ibm-truststore-mgr-1.0.0-images.csv
└── case
    └── ibm-mas
        └── inventory
            └── ibmMasSetup
                └── files
                    └── image-map.yaml
```

Requirements
------------
- `cloudctl` tool must be installed


Role Variables
--------------

- `cluster_name` -Gives a name for the provisioned cluster
- `cluster_type` quickburn
- `username` username for fyre api
- `password` password for fyre api
- `case_name` the name of the CASE bundle to be installed
- `case_bundle_dir` the location of the CASE bundle
- `case_archive_dir` the location to store cloudctl working files, typically `./archive` under the `case_bundle_dir`
- `case_inventory_name`:` the name of the Setup inventory within the CASE bundle
- `target_namespace` the namespace targetted for airgap installation
- `cp_icr_entitlement` the entitlement key for mirroring container images from cp.icr.io
- `registries` list of entries, each with `host`, `user` and `password`, credentials for each registry listed in the CASE bundle to allow image mirroring
#### Target Registry
- `registryPublicHost` the public hostname for the target registry (defaults to the value of the REGISTRY_PUBLIC_HOST environment variable)
- `registryFromCluster` the hostname for the target registry as it can be reached from the cluster (defaults to the value of the REGISTRY_FROM_CLUSTER environment variable)
- `registryUsername` the username for the target registry (defaults to the value of the REGISTRY_USERNAME environment variable)
- `registryPassword` the password for the target registry (defaults to the value of the REGISTRY_PASSWORD environment variable)
#### Optional facts
- `debugs`: comma separated string of debug output to print
- `dev_overrides` a directory containing development specific files to override the production CASE bundle


Example Playbook
----------------

```yaml
- hosts: localhost
  vars:
    # General configuration
    cluster_name: "airgap-cluster"
    cluster_type: quickburn
    username: "{{ lookup('env', 'FYRE_USERNAME') }}"
    password: "{{ lookup('env', 'FYRE_APIKEY') }}"

    # Case config
    case_name: "ibm-mas"
    case_bundle_dir: "~/ibm-mas-bundle/"
    case_archive_dir: "~/ibm-mas-bundle/archive"
    case_inventory_name: "ibmMasSetup"

    # Airgap control parameters:
    target_namespace: test-airgap # used as a DNS-1123 label so it must consist of lower case alphanumeric characters or hyphens
    debugs: "registryHosts,mirrorImageResult,configureClusterResult"
    ignoreMirrorError: false
    cp_icr_entitlement: "{{ lookup('env', 'CP_ICR_ENTITLEMENT_KEY') }}"
    dev_overrides: "~/ibm-mas-bundle-changes/"
    # Source registries (where the images come from):
    registries:
      - host: cp.icr.io
        user: cp
        password: "{{ lookup('env', 'CP_ICR_ENTITLEMENT_KEY') }}"
    # Target registry (where the images will be mirrored):
    registryPublicHost: "docker-registry.apps.airgap-test.cp.fyre.ibm.com"
    registryFromCluster: "docker-registry.docker-registry.svc:5000"
    registryUsername: "registryUser"
    registryPassword: "registryPassword"
  roles:
    - ibm.mas_airgap.case_mirror
```

License
-------

EPL-2.0
