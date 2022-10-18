case_prepare
===============================================================================

This role uses the specifed CASE bundle to mirror container images to a mirror registry and configure the cluster to pull images from this mirror.

When mirroring is complete, you can view the content of your registry:

```bash
curl -k https://$REGISTRY_PUBLIC_HOST/v2/_catalog | jq
```

Requirements
-------------------------------------------------------------------------------
The `ibm-pak` tool must be installed


Role Variables
-------------------------------------------------------------------------------
### case_name
The name of the CASE bundle to be prepare for mirroring

### case_version
The version of the CASE bundle to be prepare for mirroring

### registry_public_host
The public hostname for the target registry

### registry_public_port
The public port for the target registry

### exclude_images
A list of child CASE bundles to exclude from the mirroring process


Example Playbook
-------------------------------------------------------------------------------

```yaml
- hosts: localhost
  vars:
    case_name: ibm-mas
    case_version: 8.8.1

    exclude_images:
      - ibm-truststore-mgr
      - ibm-sls
      - ibm-mas-assist
      - ibm-mas-iot
      - ibm-mas-manage

    registry_public_host: myocp-5f1320191125833da1cac8216c06779e-0000.us-south.containers.appdomain.cloud
    registry_public_port: 32500

    exclude_images:
      - ibm-truststore-mgr
      - ibm-sls
      - ibm-mas-assist
      - ibm-mas-iot
      - ibm-mas-manage

  roles:
    - ibm.mas_airgap.case_prepare
```


License
-------

EPL-2.0
