#!/usr/bin/env bash

source variables.sh

# Authenticated Hammer Commands
hammer="hammer -u ${foreman_username} -p ${foreman_password}"

# Configure Ubuntu 20.04 ARM64
${hammer} architecture create --name "arm64"

${hammer} medium create --name "Ubuntu ARM ports" --path "http://ports.ubuntu.com" --os-family "Debian"

# On a fresh Foreman installation this will be the second OS added, so we assume from here one, that it will have the ID 2
${hammer} os create --name "Ubuntu" --description "Ubuntu 20.04 LTS ARM" --release-name "focal" --major "20" --minor "04" --family "Debian" --password-hash "SHA256" --architectures "arm64" --media "Ubuntu ARM ports" --partition-tables "Preseed default"

# For Ubuntu 18.04 we need to add manually the media and partition tables, the rest it auto configured based
# on the environment of this VM
${hammer} os update --id 1 --media "Ubuntu mirror" --partition-tables "Preseed default"

# On a fresh Foreman installation this will be the 127th template added
${hammer} template clone --name "Preseed default PXELinux" --new-name "Pilab Preseed default PXELinux"

# Template ID 128
${hammer} template clone --name "Preseed default PXEGrub2" --new-name "Pilab Preseed default PXEGrub2"

${hammer} template add-operatingsystem --name "Pilab Preseed default PXELinux" --operatingsystem "Ubuntu 20.04 LTS ARM"

${hammer} template add-operatingsystem --name "Pilab Preseed default PXEGrub2" --operatingsystem "Ubuntu 20.04 LTS ARM"

${hammer} template add-operatingsystem --name "Pilab Preseed default PXELinux" --operatingsystem "Ubuntu 18.04.5 LTS"

${hammer} template add-operatingsystem --name "Pilab Preseed default PXEGrub2" --operatingsystem "Ubuntu 18.04.5 LTS"

${hammer} os add-provisioning-template --title "Ubuntu 20.04 LTS ARM" --provisioning-template-search "Pilab"

${hammer} os add-provisioning-template --title "Ubuntu 18.04.5 LTS" --provisioning-template-search "Pilab"

${hammer} os set-default-template --id 2 --provisioning-template-id 127

${hammer} os set-default-template --id 2 --provisioning-template-id 128

${hammer} os set-default-template --id 1 --provisioning-template-id 127

${hammer} os set-default-template --id 1 --provisioning-template-id 128

###
### Create Subnet (network configuration information for provisioning)
###

${hammer} subnet create --name "Pilab Subnet" --network-type "IPv4" --network "${network_address}" --prefix "${network_prefix}" --mask "${network_mask}" --from "${network_from}" --to "${network_to}" --ipam "${network_ipam}" --boot-mode "${network_bootmode}" --domains "${network_domain}" --dhcp "${fqdn}" --tftp "${fqdn}"

###
### Create exmplary Raspberry Host
###
${hammer} host create --name "Pilab Pi 1" --architecture "arm64" --operatingsystem "Ubuntu 20.04 LTS" --medium "Ubuntu ARM ports" --partition-table "Preseed default" --pxe-loader "PXELinux BIOS" --location-title "Default Location" --organization-title "Default Organization" --root-password "${host_root_pw}"  --interface "type=${host_1_type},mac=${host_1_mac},ip=${host_1_ip},domain_id=1,subnet_id=1,managed=true,provision=true"


### x86_64 host to verify setup
${hammer} host create --name "Ubuntu VM Test" --architecture "x86_64" --operatingsystem "Ubuntu 18.04.5 LTS" --medium "Ubuntu mirror" --partition-table "Preseed default" --pxe-loader "PXELinux BIOS" --location-title "Default Location" --organization-title "Default Organization" --root-password "${host_root_pw}"  --interface "type=${host_0_type},mac=${host_0_mac},ip=${host_0_ip},domain_id=1,subnet_id=1,managed=true,provision=true"
