FROM quay.io/operator-framework/ansible-operator:v1.0.0

LABEL name="mongodb operator" \
      vendor="RH" \
      version="v0.0.1" \
      release="1" \
      summary="advanced operator" \
      description="Test for an advanced operator"

COPY requirements.yml ${HOME}/requirements.yml
#RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
# && chmod -R ug+rwx ${HOME}/.ansible

COPY licenses /licenses

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks/
