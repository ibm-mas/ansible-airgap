case_prepare
===================

Prepare the specified CASE bundle for airgap installation. It can download the CASE bundle from an internet archive or take a case bundle in a local directory.

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

- `case_name` the name of the CASE bundle to be installed
- `case_bundle_dir` the location of the CASE bundle
- `case_archive_dir` the location to store cloudctl working files, typically `./archive` under the `case_bundle_dir`
- `case_source` Optional URL of the case bundle archive to download  must be .tgz format
- `dev_overrides` a directory containing development specific files to override the production CASE bundle


Example Playbook
----------------

```yaml
- hosts: localhost
  vars:
    case_name: "ibm-mas"
    case_source: "https://github.com/IBM/cloud-pak/blob/master/repo/case/ibm-mas/8.7.2/ibm-mas-8.7.2.tgz?raw=true"
    case_bundle_dir: "/tmp/ibm-mas-bundle/"

  roles:
    - ibm.mas_airgap.case_prepare
```

License
-------

EPL-2.0
