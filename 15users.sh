#!/bin/bash

# Location of the JSON file
JSON_FILE='./user_list.json'

# Loop through the JSON file to extract user information
i=0
while [ $i -lt 15 ]
do
  USER_NAME=$(jq -r .users[$i].username $JSON_FILE)
  COMMENT=$(jq -r .users[$i].comment $JSON_FILE)
  PASSWORD=$(jq -r .users[$i].password $JSON_FILE)

  # Create the user
  useradd -c "${COMMENT}" -m ${USER_NAME}

  # Set the password for the user
  echo "${USER_NAME}:${PASSWORD}" | chpasswd

  # Force password change on first login
  passwd -e ${USER_NAME}

  i=$((i + 1))
done

# Show the users created in the server
getent passwd
{
  "users": [
    {
      "username": "user1",
      "comment": "User 1",
      "password": "password1"
    },
    {
      "username": "user2",
      "comment": "User 2",
      "password": "password2"
    },
    ...
    {
      "username": "user15",
      "comment": "User 15",
      "password": "password15"
    }
  ]
}

