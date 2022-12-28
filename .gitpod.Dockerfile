FROM gitpod/workspace-base

RUN sudo install-packages curl coreutils
RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf > elan-init.sh
RUN chmod +x elan-init.sh
RUN ./elan-init.sh -y --default-toolchain none