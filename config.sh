#!/usr/bin/env bash

source variables.sh

# Authenticated Hammer Commands
hammer="hammer -u ${foreman_username} -p ${foreman_password}"

# Configure Ubuntu 20.04 ARM64
${hammer} architecture create --name "arm64"

${hammer} medium create --name "Ubuntu ARM ports" --path "http://ports.ubuntu.com" --os-family "Debian"

${hammer} os create --name "Ubuntu" --description "Ubuntu 20.04 LTS" --release-name "focal" --major "20" --minor "04" --family "Debian" --password-hash "SHA256" --architectures "arm64,x86_64" --medium "Ubuntu ARM ports"

${hammer} clone --name "Preseed default PXELinux" --new-name "Pilab Preseed default PXELinux"

${hammer} clone --name "Preseed default PXEGrub2" --new-name "Pilab Preseed default PXEGrub2"

# ${hammer} template add-operatingsystem --name "Pilab Preseed default PXELinux" --operatingsystem "Ubuntu 20.04 LTS"

# ${hammer} template add-operatingsystem --name "Pilab Preseed default PXEGrub2" --operatingsystem "Ubuntu 20.04 LTS"

${hammer} os add-provisioning-template --title "Ubuntu 20.04 LTS" --provisioning-template-search "Pilab"
