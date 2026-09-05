#!/bin/bash

branch_name="master"
ip_address=""
environment=""

usage() {
    echo "Usage: $0 -u <admin_user> -o <organization_user> -s <true|false> -e <prod|dr> [-b <branch>] [-i <ip_address>]"
    echo
    echo "Options:"
    echo "  -u  Admin username"
    echo "  -o  Organization/system username"
    echo "  -s  Live Samba server status (true for prod, false for dr)"
    echo "  -e  Environment: prod or dr"
    echo "  -b  Git branch (default: master)"
    echo "  -i  Optional IP address"
}

while getopts h:o:u:s:b:i:e: option
do
    case "${option}"
        in
        h)hostname=${OPTARG};;
        o)orgusername=${OPTARG};;
        u)username=${OPTARG};;
        s)live_samba_server_status=${OPTARG};;
        b)branch_name=${OPTARG};;
        i)ip_address=${OPTARG};;
        e)environment=${OPTARG};;
        \?)usage; exit 1;;
    esac
done

if [[ -z "${username:-}" || -z "${orgusername:-}" || -z "${live_samba_server_status:-}" || -z "$environment" ]]; then
    echo "Error: -u, -o, -s, and -e are required." >&2
    usage >&2
    exit 1
fi

if [[ "$environment" != "prod" && "$environment" != "dr" ]]; then
    echo "Error: -e must be either 'prod' or 'dr'." >&2
    usage >&2
    exit 1
fi

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
echo -e "Environment : $environment\n"
sleep 1
if [ -n "$ip_address" ]; then
    echo -e "IP Address : $ip_address\n"
fi
cd $tmp_dir
ls $tmp_dir

if [ -n "$ip_address" ]; then
    bash $tmp_dir/ansible-ubuntu-setup.sh -u $username -o $orgusername -s $live_samba_server_status -i "$ip_address" -e $environment | tee /var/tmp/server_config_main.txt
else
    bash $tmp_dir/ansible-ubuntu-setup.sh -u $username -o $orgusername -s $live_samba_server_status -e $environment | tee /var/tmp/server_config_main.txt
fi

rm -rf $tmp_dir

echo -e "Taking final reboot"
reboot
