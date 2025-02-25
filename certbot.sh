echo "Enter the domains you need to enable ssl for (space separated)"
read domains


# Install Resources 
sudo apt update
sudo apt install python3 python3-venv libaugeas0

sudo python3 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
sudo /opt/certbot/bin/pip install certbot certbot-nginx
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot


sudo certbot -d $domains


# ufw
read -p  "Do you want to enable ufw (y/n)" input

if [ "$input" == "yes" ]; then
  read -p "Which ports do you want to enable ufw for" ports
  ufw allow $ports
else 
  echo "Exiting"
  exit 1
fi
  



