#!/bin/bash

# This script will create a linux user

USER_NAME=$1
COMMENT=$2
PASSWORD=$3

# Ask for the user name.
read -p 'Enter the username to create: ' USER_NAME

# Ask for the real Name.
read -p 'Enter the name of the person who this account is for: ' COMMENT

# Ask for the Password.
read -p 'Enter the password to use for the account: ' PASSWORD

# Create the user.
sudo useradd -c "${COMMENT}" -m ${USER_NAME}

# Set the password for the user.
sudo echo "${USER_NAME}:${PASSWORD}" | chpasswd

#Force Password change on first login.
sudo passwd -e ${USER_NAME}

# shows the user created in server
sudo getent passwd | grep $USER_NAME
