#!/usr/bin/env bash


# General Config
fqdn="foreman.fritz.box"
network_domain="fritz.box"
ip="192.168.188.126"
network_interface="enp0s9"
# network_interface=$(nmcli -f DEVICE device | grep enp | tr -d [:space:])
foreman_username="pilab"
foreman_password="pilab"


# Subnet Config
network_address="192.168.188.1"
network_from="192.168.188.50"
network_to="192.168.188.120"
network_prefix="24"
network_mask="255.255.255.0"
network_ipam="DHCP"
network_bootmode="DHCP"

# Host Config
host_root_pw="12345678"

# x86_64 Test VM
host_0_type="interface"
host_0_mac="080027D4A579"
host_0_ip="192.168.188.100"

# Pi 1
host_1_type="interface"
host_1_mac="dca632308763"
host_1_ip="192.168.188.101"
