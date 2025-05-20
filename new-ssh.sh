echo "Enter your github email"
read email


# Create ssh key
ssh-keygen -t ed25519 -C $email


eval "$(ssh-agent -s)"

#setup  ssh file
#!/bin/bash

# Variables — Change these as per your setup
HOST_ALIAS="github.com"
HOST_NAME="github.com"
USER_NAME="git"
IDENTITY_FILE="$HOME/.ssh/id_rsa"

# Ensure ~/.ssh directory exists
mkdir -p "$HOME/.ssh"

# Ensure the config file exists
CONFIG_FILE="$HOME/.ssh/config"
touch "$CONFIG_FILE"

# Check if host config already exists
if ! grep -q "Host $HOST_ALIAS" "$CONFIG_FILE"; then
  echo -e "\n# SSH Config for $HOST_ALIAS" >> "$CONFIG_FILE"
  echo "Host $HOST_ALIAS" >> "$CONFIG_FILE"
  echo "  HostName $HOST_NAME" >> "$CONFIG_FILE"
  echo "  User $USER_NAME" >> "$CONFIG_FILE"
  echo "  IdentityFile $IDENTITY_FILE" >> "$CONFIG_FILE"
  echo "  IdentitiesOnly yes" >> "$CONFIG_FILE"
  echo "Added SSH config for $HOST_ALIAS"
else
  echo "SSH config for $HOST_ALIAS already exists in $CONFIG_FILE"
fi

# Set correct permissions
chmod 600 "$CONFIG_FILE"
chmod 700 "$HOME/.ssh"

echo "Done. SSH config setup is complete."



echo "Copying the public key to your clipboard"
pbcopy < ~/.ssh/id_ed25519.pub
echo "Now, go to github settings and paste the public ssh key"
