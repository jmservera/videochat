sudo apt-get update && sudo apt-get install -y dnsutils && sudo apt-get install -y coturn

echo "realm=$3
server-name=$3
lt-cred-mech
userdb=/var/lib/turn/turndb
cert=/etc/ssl/turn_server_cert.pem
pkey=/etc/ssl/turn_server_pkey.pem
 
no-stdout-log"  | tee /etc/turnserver.conf

openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/turn_server_pkey.pem -out /etc/ssl/turn_server_cert.pem -days 365

turnadmin -a -u $1 -p $2 -r $3

turnserver
