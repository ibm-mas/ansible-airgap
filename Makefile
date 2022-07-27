#!/bin/bash

.PHONY: ansible-build ansible-install ansible-all docker-build docker-run docker-all clean

.DEFAULT_GOAL := ansible-all

ansible-build:
	ansible-galaxy collection build --output-path image/ansible-airgap/app-root ibm/mas_airgap --force
	mv image/ansible-airgap/app-root/ibm-mas_airgap-2.0.0.tar.gz image/ansible-airgap/app-root/ibm-mas_airgap.tar.gz
ansible-install:
	ansible-galaxy collection install image/ansible-airgap/app-root/ibm-mas_airgap.tar.gz --force
ansible-all: ansible-build ansible-install

docker-build:
	docker build -t ansible-airgap:local image/ansible-airgap
docker-run:
	docker run -ti ansible-airgap:local
docker-all: docker-build docker-run

clean:
	rm image/ansible-airgap/ibm-mas_airgap.tar.gz
