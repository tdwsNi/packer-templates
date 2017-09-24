#!/bin/sh -eux
export DEBIAN_FRONTEND=noninteractive

#Set hostname
hostnamectl set-hostname "$HOST_NAME"

# Update the package list
apt-get -y update;

# Upgrade all installed packages incl. kernel and kernel headers
apt-get -y dist-upgrade -o Dpkg::Options::="--force-confnew";
