FROM quay.io/ibmmas/ansible-devops:10.0.4

USER root

# Install Ansible Collection
COPY ibm-mas_airgap.tar.gz ${HOME}/ibm-mas_airgap.tar.gz
RUN ansible-galaxy collection install ${HOME}/ibm-mas_airgap.tar.gz -p /opt/app-root/lib64/python3.8/site-packages/ansible_collections --force
