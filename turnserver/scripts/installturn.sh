# it is important to use an static IP so this value does not change over time

# first get all the files
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update && sudo apt-get install -y dnsutils coturn certbot

sudo systemctl stop coturn

# enable service
sudo echo "TURNSERVER_ENABLED=1" > /etc/default/coturn

# create configuration
echo "listening-port=3478
tls-listening-port=5349

external-ip=$4
realm=$3
server-name=$3

lt-cred-mech
fingerprint

userdb=/var/lib/turn/turndb

cert= /etc/letsencrypt/live/$3/cert.pem
pkey= /etc/letsencrypt/live/$3/privkey.pem

use-auth-secret
static-auth-secret=$2

cli-password=$2

log-file=/var/log/turnserver.log
verbose
no-stdout-log"  > /etc/turnserver.conf

# add an admin user, will be needed 
turnadmin -a -u $1 -p $2 -r $3

sudo systemctl start coturn

# use certbot to create coturn certificate, you need to have port 80 open to allow the certbot to verify
sudo certbot certonly --standalone --deploy-hook "systemctl restart coturn" -d $3 --agree-tos --no-eff-email --register-unsafely-without-email



