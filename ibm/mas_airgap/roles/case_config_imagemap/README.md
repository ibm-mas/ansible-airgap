case_mirror
===========
This role uses the specifed CASE bundle to mirror container images to a mirror registry and configure the cluster to pull images from this mirror.

When mirroring is complete, you can view the content of your registry:

```bash
curl -k https://$REGISTRY_PUBLIC_HOST/v2/_catalog | jq
```

Requirements
------------
- `cloudctl` tool must be installed


Role Variables
--------------

- `case_name` the name of the CASE bundle to be installed
- `case_bundle_dir` the location of the CASE bundle
- `case_archive_dir` the location to store cloudctl working files, typically `./archive` under the `case_bundle_dir`
- `case_inventory_name`:` the name of the Setup inventory within the CASE bundle
- `ibm_entitlement_key` the entitlement key for mirroring container images from cp.icr.io
- `registry_public_host` the public hostname for the target registry (defaults to the value of the REGISTRY_PUBLIC_HOST environment variable)


Example Playbook
----------------

```yaml
- hosts: localhost
  vars:
    case_name: ibm-mas
    case_bundle_dir: /tmp/casebundle
    case_inventory_name: "ibmMasSetup"

    registry_public_host: myocp-5f1320191125833da1cac8216c06779e-0000.us-south.containers.appdomain.cloud:32500

  roles:
    - ibm.mas_airgap.case_mirror
```


License
-------

EPL-2.0
