ocp_mirror_mas_deps
==================

This role provides support to mirror container images operators that are required by MAS to work in an airgap environment. This includes images for:
- Service Binding Operator
- Cert Manager 
- Openshift Container Storage
- IBM Common Services Operator
- Behaviour Analytics Service

Images are defined as pseudo-CASE bundle archives in the `/files/case-bundles` directory so that the images can be mirrored and the cluster configured using the `case_mirror` role.

Environment Variables
---------------------
Include user and entitlement keys for those registries that we are pulling images from. 
- `REDHAT_IO_USER` an entitlement key for mirroring container images from registry.redhat.io and registry.connect.redhat.com
- `REDHAT_IO_ENTITLEMENT_KEY` an user name for mirroring container images from registry.redhat.io and registry.connect.redhat.com
- `QUAY_IO_USER` a user name for mirroring container images from quay.io
- `QUAY_IO_ENTITLEMENT_KEY` an entitlement key for mirroring container images from quay.io

Role Variables
--------------

- `cluster_name` -Gives a name for the provisioned cluster
- `cluster_type` quickburn
- `username` username for fyre api
- `password` password for fyre api
#### Target Registry
- `registryPublicHost` the public hostname for the target registry (defaults to the value of the REGISTRY_PUBLIC_HOST environment variable)
- `registryFromCluster` the hostname for the target registry as it can be reached from the cluster (defaults to the value of the REGISTRY_FROM_CLUSTER environment variable)
- `registryUsername` the username for the target registry (defaults to the value of the REGISTRY_USERNAME environment variable)
- `registryPassword` the password for the target registry (defaults to the value of the REGISTRY_PASSWORD environment variable)

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

    # Target registry (where the images will be mirrored):
    registryPublicHost: "docker-registry.apps.airgap-test.cp.fyre.ibm.com"
    registryFromCluster: "docker-registry.docker-registry.svc:5000"
    registryUsername: "registryUser"
    registryPassword: "registryPassword"
  roles:
    - ibm.mas_airgap.ocp_mirror_mas_dpes
```

License
-------

EPL-2.0
