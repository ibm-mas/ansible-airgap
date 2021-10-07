# CASE Playbooks
These playbooks use a CASE bundle run the airgap installation of a comtainerised component.

## Airgap Install
This playbook calls the other sub-playbooks in sequence to preapre a case bundle, mirror the container images and install the case bundle into a cluster. 

### Required environment variables
TODO

### Optional environment variables
TODO

## Install Case
This playbook uses a CASE bundle to run the airgap installation of the CASE operator. 

### Required environment variables
TODO

### Optional environment variables
TODO

## Mirror Case
This role uses the specifed CASE bundle to mirror container images to a mirror registry and configure the cluster to pull images from this mirror.

### Required environment variables
TODO

### Optional environment variables
TODO

## Prepare Case
This playbook prepares the specified CASE bundle for airgap installation. It can download the CASE bundle from an internet archive or take a case bundle in a local directory.

### Required environment variables
TODO

### Optional environment variables
TODO
