# ccesetup

Step-01: Download 
Open URL in Firefox browser: https://github.com/mohanpoddar/ccesetup

- Go to Code from top menu -> Expand Code under the Code -> Click on Download ZIP -> Wait for download to be completed.

- Once Download completed -> Go to folder where code https://github.com/mohanpoddar/ccesetup is downloaded -> You will see a zip file named ccesetup-main.zip -> right click and then click extract here -> A new folder ccesetup-main will be created -> Right click new folder ccesetup-main -> Open in Terminal -> This will directly opnen your ccesetup-main director in command line terminal

Now follow the next step 
 

Step-02: List the script
$ ls
cce-setup.sh 

Step-03: Run below command from root.
o - For original user while creating the os
u - creating new user ex. devopsadmin

Run below command with your system default user created at build time
$ sudo bash cce-setup.sh -u devopsadmin -o cce

Step-04: Take final reboot if not rebooted already
