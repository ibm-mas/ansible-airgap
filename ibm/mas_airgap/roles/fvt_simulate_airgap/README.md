fvt_simulate_airgap
===================

This role provides to support to configure a cluster for simulated airgap installation testing. This includes disabling network access to public image repositories and sets up the OCP Internal Registry and/or docker registry in preparation for image mirroring.

Role Variables
--------------

- `cluster_name` -Gives a name for the provisioned cluster
- `cluster_type` quickburn
- `username` username for fyre api
- `password` password for fyre api
- `cluster_url` - url suffix for external access to the cluster
#### Optional facts
- `use_internal_registry` - set to true to configure OCP Internal Registry for image mirroring
- `use_docker_registry` - set to true to install and configure a docker registry for image mirroring
- `use_docker_registry` - set to true to install and configure a docker registry for image mirroring- `debugs`: comma separated string of debug output to print
- `dockerio_username` - a username entitled to download docker.io/library/registry:2.6.2 image. Only required if `use_docker_registry` is true
- `dockerio_password` - a password entitled to download docker.io/library/registry:2.6.2 image. Only required if `use_docker_registry` is true
- `registry_size` - the configured size of the docker registry (defaults to 400Gi)
- `registry_storage_class` - the storage class from which the docker registry storage is created (defaults to "ocs-storagecluster-cephfs")
- `airgap_network_exclusions` - a space separated list of hostnames to which network traffic will be misdirected (defaults to "icr.io cp.icr.io wiotp-docker-local.artifactory.swg-devops.com")

Example Playbook
----------------

```yaml
- hosts: localhost
  vars:
    # General configuration
    cluster_name: "{{ lookup('env', 'CLUSTER_NAME') }}"
    cluster_type: quickburn
    username: "{{ lookup('env', 'FYRE_USERNAME') }}"
    password: "{{ lookup('env', 'FYRE_APIKEY') }}"
    cluster_url: "apps.{{ cluster_name }}.cp.fyre.ibm.com"
    # Airgap control parameters:
    debugs: "registryHosts,mirrorImageResult,configureClusterResult"

  roles:
    - role: ibm.mas_devops.fvt_simulate_airgap
```

License
-------

EPL-2.0
