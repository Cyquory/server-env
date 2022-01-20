#!/usr/bin/env bash

# extends the sudo timeout for another 15 minutes
sudo -v

# kickstart script
bash <(curl -Ss https://my-netdata.io/kickstart.sh)

# Confirm Netdata is running
sudo systemctl status netdata

# Configure firewall
sudo ufw allow 19999/tcp
sudo ufw reload