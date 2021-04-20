#!/usr/bin/env bash

source variables.sh

sudo hostnamectl set-hostname ${fqdn}

sudo foreman-installer \
--enable-foreman \
--enable-foreman-cli \
--enable-foreman-proxy \
--enable-puppet \
--foreman-initial-admin-username="${foreman_username}" \
--foreman-initial-admin-password="${foreman_password}" \
--puppet-server-foreman-url="https://${fqdn}" \
--foreman-proxy-foreman-base-url="https://${fqdn}" \
--foreman-proxy-trusted-hosts="${fqdn}" \
--foreman-proxy-tftp=true \
--foreman-proxy-tftp-servername="${ip}" \
--foreman-proxy-dhcp=true \
--foreman-proxy-dhcp-interface="${network_interface}" \
--foreman-proxy-dhcp-nameservers="${ip}"


# --enable-foreman-plugin-discovery \
# --enable-foreman-plugin-setup \
# --enable-foreman-proxy-plugin-discovery \
# --enable-foreman-cli-discovery \
# --foreman-proxy-dhcp-gateway= \
# # Disable Monitoring Plugins explicitly since they did not work
# --no-enable-foreman-plugin-monitoring \
# --no-enable-foreman-proxy-plugin-monitoring \
# --foreman-proxy-httpboot=true
# --foreman-proxy-httpboot-listen-on="both"


###
### Goodies for making it easier to work with the VM
###

# Edit pinned applications
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop']"

# Disable screen lock
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0
