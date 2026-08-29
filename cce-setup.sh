#!/bin/bash

branch_name="master"
ip_address=""

while getopts h:o:u:s:b:i: option
do
    case "${option}"
        in
        h)hostname=${OPTARG};;
        o)orgusername=${OPTARG};;
        u)username=${OPTARG};;
        s)live_samba_server_status=${OPTARG};;
        b)branch_name=${OPTARG};;
        i)ip_address=${OPTARG};;
    esac
done

# tmp_dir=$(mktemp -d -t ci-XXXXXXXXXX)
tmp_dir='/var/tmp/repo'
echo -e "Creating Temporary Directory"
mkdir -p $tmp_dir
echo -e "Check directory Created"
ls -ld $tmp_dir

echo $tmp_dir

apt install git -y

git clone -b "$branch_name" https://github.com/mohanpoddar/cce.git "$tmp_dir"

echo -e "\nSystemuser : $orgusername"
sleep 1
echo -e "Admin User : $username\n"
sleep 1
echo -e "Live Samba Server Status : $live_samba_server_status\n"
sleep 1
if [ -n "$ip_address" ]; then
    echo -e "IP Address : $ip_address\n"
fi
cd $tmp_dir
ls $tmp_dir

if [ -n "$ip_address" ]; then
    bash $tmp_dir/ansible-ubuntu-setup.sh -u $username -o $orgusername -s $live_samba_server_status -i "$ip_address" | tee /var/tmp/server_config_main.txt
else
    bash $tmp_dir/ansible-ubuntu-setup.sh -u $username -o $orgusername -s $live_samba_server_status | tee /var/tmp/server_config_main.txt
fi

rm -rf $tmp_dir

echo -e "Taking final reboot"
#reboot
