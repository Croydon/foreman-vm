#!/usr/bin/env bash

source variables.sh

# Authenticated Hammer Commands
hammer="hammer -u ${foreman_username} -p ${foreman_password}"

# Configure Ubuntu 20.04 ARM64
${hammer} architecture create --name "arm64"

${hammer} medium create --name "Ubuntu ARM ports" --path "http://ports.ubuntu.com" --os-family "Debian"

# On a fresh Foreman installation this will be the second OS added, so we assume from here one, that it will have the ID 2
${hammer} os create --name "Ubuntu" --description "Ubuntu 20.04 LTS ARM" --release-name "focal" --major "20" --minor "04" --family "Debian" --password-hash "SHA256" --architectures "arm64" --media "Ubuntu ARM ports" --partition-tables "Preseed default"

# On a fresh Foreman installation this will be the 127th template added
${hammer} template clone --name "Preseed default PXELinux" --new-name "Pilab Preseed default PXELinux"

# Template ID 128
${hammer} template clone --name "Preseed default PXEGrub2" --new-name "Pilab Preseed default PXEGrub2"

${hammer} template add-operatingsystem --name "Pilab Preseed default PXELinux" --operatingsystem "Ubuntu 20.04 LTS ARM"

${hammer} template add-operatingsystem --name "Pilab Preseed default PXEGrub2" --operatingsystem "Ubuntu 20.04 LTS ARM"

# ${hammer} template add-operatingsystem --name "Pilab Preseed default PXELinux" --operatingsystem "Ubuntu 20.04 LTS"

# ${hammer} template add-operatingsystem --name "Pilab Preseed default PXEGrub2" --operatingsystem "Ubuntu 20.04 LTS"

${hammer} os add-provisioning-template --title "Ubuntu 20.04 LTS ARM" --provisioning-template-search "Pilab"

${hammer} os set-default-template --id 2 --provisioning-template-id 127

${hammer} os set-default-template --id 2 --provisioning-template-id 128

###
### Create Subnet (network configuration information for provisioning)
###

# Only one Smart Proxy is implicit created, so the httpboot-id is assumed to be 1
# Hammer does allow to use names for DHCP and TFTP, but not HTTPBOOT for some reason
${hammer} subnet create --name "Pilab Subnet" --network-type "IPv4" --network "${network_address}" --prefix "${network_prefix}" --mask "${network_mask}" --from "${network_from}" --to "${network_to}" --ipam "${network_ipam}" --boot-mode "${network_bootmode}" --domain "${network_domain}" --dhcp "${fqdn}" --tftp "${fqdn}" --httpboot-id "1"
