#!/bin/bash

branch_name="master"

while getopts h:o:u:s:b: option
do
    case "${option}"
        in
        h)hostname=${OPTARG};;
        o)orgusername=${OPTARG};;
        u)username=${OPTARG};;
        s)live_samba_server_status=${OPTARG};;
        b)branch_name=${OPTARG};;
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
cd $tmp_dir
ls $tmp_dir

bash $tmp_dir/ansible-ubuntu-setup.sh -u $username -o $orgusername -s $live_samba_server_status | tee /var/tmp/server_config_main.txt

rm -rf $tmp_dir

echo -e "Taking final reboot"
#reboot
