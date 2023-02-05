#!/bin/bash

for i in {1..5}
do
  echo "Enter username for user $i: "
  read username

  echo "Enter password for user $i: "
  read -s password

  # Create user
  sudo useradd $username

  # Set password for user
  echo "$username:$password" | chpasswd

  echo "User $username created successfully."
done

# Confirm deletion of all users
echo "Do you want to delete all the created users? (y/n)"
read -n 1 confirmation

if [ "$confirmation" == "y" ]; then
  for i in {1..5}
  do
    echo "Enter username for user $i: "
    read username

    # Delete user
    sudo userdel $username

    echo "User $username deleted successfully."
  done
else
  echo "Users will not be deleted."
fi
