#!/bin/bash

while getopts h:o:u: option
do 
    case "${option}"
        in
        h)hostname=${OPTARG};;
        o)orgusername=${OPTARG};;
        u)username=${OPTARG};;
    esac
done

# tmp_dir=$(mktemp -d -t ci-XXXXXXXXXX)
tmp_dir='/var/tmp/repo'
echo -e "Creating Temporary Directory"
mkdir -p $tmp_dir
echo -e ""Check directory Created
ls -ld $tmp_dir

echo $tmp_dir

apt install git -y

git clone https://github.com/mohanpoddar/cce.git $tmp_dir

echo -e "\nSystemuser : $orgusername"
sleep 1
echo -e "Admin User : $username\n"
sleep 1
cd $tmp_dir
ls $tmp_dir

bash $tmp_dir/ansible-ubuntu-setup.sh -u $username -o $orgusername | tee /var/tmp/server_config_main.txt

rm -rf $tmp_dir

echo -e "Taking final reboot"
#reboot
