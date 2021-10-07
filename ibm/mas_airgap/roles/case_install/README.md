case_install
===================

This role uses a CASE bundle and the `cloudctl` tool to run the airgap installation of the CASE operator.


Requirements
------------
- `cloudctl` tool must be installed

Role Variables
--------------

- `cluster_name` Gives a name for the provisioned cluster
- `cluster_type` quickburn
- `username` username for fyre api
- `password` password for fyre api
- `case_name` the name of the CASE bundle to be installed
- `case_bundle_dir` the location of the CASE bundle
- `case_archive_dir` the location to store cloudctl working files, typically `./archive` under the `case_bundle_dir`
- `case_inventory_name`:` the name of the Setup inventory within the CASE bundle
- `target_namespace` the namespace targetted for airgap installation

#### Optional facts
- `debugs`: comma separated string of debug output to print


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
    target_namespace: "mas-airgaptest-core"
    debugs: "_oc_status,installOperatorResult"

  roles:
    - ibm.mas_airgap.case_install

```

License
-------

EPL-2.0
