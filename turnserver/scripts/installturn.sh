sudo apt-get update && sudo apt-get install -y dnsutils && sudo apt-get install -y coturn certbot

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

stale-nonce

use-auth-secret
static-auth-secret=$2

cli-password=$2

log-file=/var/log/turnserver.log
verbose
no-stdout-log"  | tee /etc/turnserver.conf

# add an admin user, will be needed 
turnadmin -a -u $1 -p $2 -r $3

sudo systemctl start coturn

# you can generate self signed certificates, use real ones for a production server like with the certbot
#openssl req -x509 -newkey rsa:4096 -passout pass:falsepass -keyout /etc/ssl/turn_server_pkey.pem -out /etc/ssl/turn_server_cert.pem -days 365 -subj '/CN=www.mydom.com/O=My Company Name LTD./C=US'

sudo certbot certonly --standalone --deploy-hook "systemctl restart coturn" -d $3 --agree-tos --no-eff-email



