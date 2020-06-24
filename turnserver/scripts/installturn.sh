sudo apt-get update && sudo apt-get install -y dnsutils && sudo apt-get install -y coturn

systemctl stop coturn

echo "TURNSERVER_ENABLED=1" > /etc/default/coturn

echo "realm=$3
server-name=$3
lt-cred-mech
userdb=/var/lib/turn/turndb
cert=/etc/ssl/turn_server_cert.pem
pkey=/etc/ssl/turn_server_pkey.pem
 
no-stdout-log"  | tee /etc/turnserver.conf

#generate self signed certificates, use real ones for a production server
openssl req -x509 -newkey rsa:4096 -passout pass:falsepass -keyout /etc/ssl/turn_server_pkey.pem -out /etc/ssl/turn_server_cert.pem -days 365 -subj '/CN=www.mydom.com/O=My Company Name LTD./C=US'

turnadmin -a -u $1 -p $2 -r $3

systemctl start coturn
