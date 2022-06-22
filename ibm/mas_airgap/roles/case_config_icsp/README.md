case_config_icsp
===========
This role uses the specifed CASE bundle to configure the cluster to pull images from the mirror.


Requirements
------------
- `cloudctl` tool must be installed


Role Variables
--------------

- `case_name` the name of the CASE bundle to be installed
- `case_bundle_dir` the location of the CASE bundle
- `case_archive_dir` the location to store cloudctl working files, typically `./archive` under the `case_bundle_dir`
- `case_inventory_name`:` the name of the Setup inventory within the CASE bundle


Example Playbook
----------------

```yaml
- hosts: localhost
  vars:
    case_name: ibm-mas
    case_bundle_dir: /tmp/casebundle
    case_inventory_name: "ibmMasSetup"

  roles:
    - ibm.mas_airgap.case_config_icsp
```


License
-------

EPL-2.0
