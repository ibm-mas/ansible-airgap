FROM quay.io/ibmmas/ansible-devops:10.1.0-pre.entitlementconsolidation

COPY ibm-mas_airgap.tar.gz ${HOME}/ibm-mas_airgap.tar.gz

# Install skopeo & cloudctl & hostname (needed by cloudctl) & httpd-tools (needed for htpasswd cmd)
RUN dnf install skopeo hostname httpd-tools -y &&\
    dnf clean all &&\
    wget -q https://github.com/IBM/cloud-pak-cli/releases/download/v3.17.0/cloudctl-linux-amd64.tar.gz &&\
    tar -xvf cloudctl-linux-amd64.tar.gz &&\
    mv cloudctl-linux-amd64 /usr/bin/cloudctl &&\
    rm cloudctl-linux-amd64.tar.gz

# Install Ansible Collection
RUN ansible-galaxy collection install ${HOME}/ibm-mas_airgap.tar.gz -p $ANSIBLE_COLLECTIONS_PATH --force &&\
    rm ${HOME}/ibm-mas_airgap.tar.gz &&\
    ln -s $ANSIBLE_COLLECTIONS_PATH/ibm/mas_airgap /opt/app-root/airgap
