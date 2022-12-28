FROM gitpod/workspace-base

RUN sudo install-packages curl \
    && curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh