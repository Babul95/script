#!/bin/bash
#Run this Security Update.
sudo yum update –security
#Disable Root Login.
#sudo cat /etc/ssh/sshd_config | grep PermitRootLogin
#3.	Allow User in SSHD and Necessary changes.
#ClientAliveInterval 15m
#ClientAliveCountMax 1
#Port 56456
# AllowGroups prod-linux-server-admin ngadmin
# AuthenticationMethods password

# Ciphers aes128-ctr,aes192-ctr,aes256-ctr
# MACs umac-64@openssh.com,hmac-ripemd160,hmac-sha2-256


# Match User  ngadmin
#         AuthenticationMethods publickey
#4.	Verify SSH Changes.
# sudo systemctl reload sshd
# #5.	Set Permanent Audit Rule
# /etc/audit/rules.d/audit.rules
# -a exit,always -F arch=b64 -F euid=0 -S execve -k rootcmd
# -a exit,always -F arch=b32 -F euid=0 -S execve -k rootcmd
# #6.	Set user permission.
# /etc/sudoers
# %Dev-Linux-Server-Admin@nownowad.ng ALL=(ALL) NOPASSWD: ALL
# ngadmin ALL=(ALL) NOPASSWD: ALL
#7.	Create User.
useradd -m -s /bin/bash ngadmin
sudo su - ngadmin
mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys

useradd -m -s /bin/bash devuser
