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

### case_name
The name of the CASE bundle to be installed

- **Required**
- Environment Variable: `CASE_NAME`
- Default: None

### case_bundle_dir
The location of the CASE bundle

- **Required**
- Environment Variable: `CASE_BUNDLE_DIR`
- Default: None

### case_archive_dir
The location to store cloudctl working files.

- Optional
- Environment Variable: None
- Default: `{{ case_bundle_dir }}/archive`

### case_source
Use this optional parameter to instruct the role to download the case bundle archive.  Download must be in `.tgz` format.

- Optional
- Environment Variable: `CASE_SOURCE`
- Default: None

### dev_overrides
A directory containing development specific files to override the production CASE bundle

- Optional
- Environment Variable: None
- Default: None

### exclude_images
Some CASE bundles contain child CASE bundles which can introduce unwanted images into the mirroring process.  Provide a list of cases to exclude from the mirroring process, this will result in their image manifest being removed from the working directory created by this role.

- Optional
- Environment Variable: None
- Default: `[]`


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
