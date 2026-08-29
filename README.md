# Project Title

Simple overview of use/purpose of cce-setup.sh.

## Description

An in-depth paragraph about your project and overview of use.

## Getting Started

### Dependencies

* Ubuntu must be installed
* ex. Ubuntu 24.04

### Installing

* Open URL in Firefox browser: https://github.com/mohanpoddar/ccesetup
* Go to Code from top menu
    - Expand Code under the Code
    - Click on Download ZIP
    - Wait for download to be completed
* Once Download completed
    - Go to folder where code https://github.com/mohanpoddar/ccesetup is downloaded. You will see a zip file named ccesetup-main.zip
    - Right click and then click Extract Here. A new folder ccesetup-main will be created
    - Right click new folder ccesetup-main and click Open in Terminal
    - This will directly open your ccesetup-main directory in command line terminal.

### Executing program

* How to run the program
* Follow below instruction to setup your Live and Backup Data server.

* List contents
```
$ ls
cce-setup.sh 
```

Use the script to clone the repository branch needed for setup. If no branch is specified, it defaults to the `master` branch.

* Clone default branch (`master`)
```
sudo bash cce-setup.sh -u devopsadmin -o cce -s true | tee /var/tmp/server_config_initial.txt
```
PROD Server:

* Live Server: For Samba Live Data Server
```
sudo bash cce-setup.sh -b master -u devopsadmin -o cce -s true | tee /var/tmp/server_config_initial.txt
```

* Clone a specific branch
```
sudo bash cce-setup.sh -b ccedev01 -u devopsadmin -o cce -s true | tee /var/tmp/server_config_initial.txt
```

* DR Server: For Samba DR Data Server (default `master`)
```
sudo bash cce-setup.sh -u devopsadmin -o cce -s false | tee /var/tmp/server_config_initial.txt
```

* DR Server: For Samba DR Data Server with a specific branch
```
sudo bash cce-setup.sh -b ccedev01 -u devopsadmin -o cce -s false | tee /var/tmp/server_config_initial.txt
```

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors

Contributors names and contact info

Mohan Poddar

## Version History

* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [DomPizzie](https://gist.github.com/DomPizzie/7a5ff55ffa9081f2de27c315f5018afc)
