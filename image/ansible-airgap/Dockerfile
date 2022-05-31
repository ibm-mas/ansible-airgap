FROM quay.io/ibmmas/ansible-devops:10.1.0-pre.addcs

USER root

# Install skopeo & cloudctl & hostname (needed by cloudctl)
RUN dnf install skopeo hostname -y &&\
    wget -q https://github.com/IBM/cloud-pak-cli/releases/download/v3.17.0/cloudctl-linux-amd64.tar.gz &&\
    tar -xvf cloudctl-linux-amd64.tar.gz &&\
    mv cloudctl-linux-amd64 /usr/bin/cloudctl &&\
    rm cloudctl-linux-amd64.tar.gz

# Install Ansible Collection
COPY ibm-mas_airgap.tar.gz ${HOME}/ibm-mas_airgap.tar.gz
RUN ansible-galaxy collection install ${HOME}/ibm-mas_airgap.tar.gz -p /opt/app-root/lib64/python3.8/site-packages/ansible_collections --force
