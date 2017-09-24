#!/bin/sh -eux

# Delete all Linux headers
dpkg --list \
| awk '{ print $2 }' \
| grep 'linux-headers' \
| xargs apt-get -y purge;

# Remove specific Linux kernels, such as linux-image-3.11.0-15-generic but
# keeps the current kernel and does not touch the virtual packages,
# e.g. 'linux-image-generic', etc.
dpkg --list \
| awk '{ print $2 }' \
| grep 'linux-image-[234].*' \
| grep -v "$(uname -r)" \
| xargs apt-get -y purge;

# Delete Linux source
dpkg --list \
| awk '{ print $2 }' \
| grep linux-source \
| xargs apt-get -y purge;

# Delete development packages
dpkg --list \
| awk '{ print $2 }' \
| grep -- '-dev$' \
| xargs apt-get -y purge;

# Delete docs packages
#dpkg --list \
#| awk '{ print $2 }' \
#| grep -- '-doc$' \
#| xargs apt-get -y purge;

#Clean dhcp leases
rm /var/lib/dhcp/*

# Delete X11 libraries
apt-get -y purge libx11-data xauth libxmuu1 libxcb1 libx11-6 libxext6;

# Delete obsolete networking
apt-get -y purge ppp pppconfig pppoeconf;

# Delete oddities
apt-get -y purge popularity-contest installation-report friendly-recovery bash-completion laptop-detect;

apt-get -y autoremove --purge;
apt-get -y clean;
apt-get -y autoclean

# Remove docs
#rm -rf /usr/share/doc/*

# Remove caches
find /var/cache -type f -exec rm -rf {} \;

# delete any logs that have built up during the install
find /var/log/ -name "*.log" -exec rm -f {} \;
