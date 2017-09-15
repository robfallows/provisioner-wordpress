#!/bin/sh

# Don't pipe to /var/log/cloud-init-output.log in AWS!!!
if [ -f .vagrant_provisioned ] ; then
    exit 0
fi


echo -n "Updating Package Repository ... "
apt-get update > /var/log/cloud-init-output.log && echo "[ Done ]"

echo -n "Updating OS Packages ... "
apt-get upgrade -y >> /var/log/cloud-init-output.log && echo "[ Done ]"

echo -n "Installing Python ... "
apt-get install python -y >> /var/log/cloud-init-output.log && echo "[ Done ]"

echo -n "Marking as provisioned by userdata.sh ... "
touch .vagrant_provisioned && echo "[ Done ]"
