ufw disable 
ufw default deny
ufw allow in 22/tcp
ufw allow in 80/tcp
ufw allow proto tcp from 172.17.0.0/16 to 172.17.0.1 port 2375
ufw --force enable
