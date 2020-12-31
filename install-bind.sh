sudo apt-get update
sudo apt-get install bind9 bind9utils bind9-doc dnsutils -y

# Apply basic configurations

# The below config is for a network 192.168.1.0/24, adjust according to your network configuration before executing

# Update named.conf.options
cat <<EOT >> /etc/bind/named.conf.options
options {
        directory "/var/cache/bind";
        auth-nxdomain no;    # conform to RFC1035
     // listen-on-v6 { any; };
        listen-on port 53 { localhost; 192.168.1.0/24; };
        allow-query { localhost; 192.168.1.0/24; };
        forwarders { 8.8.8.8; };
        recursion yes;
        };
EOT

# Update named.conf.local
cat <<EOT >> /etc/bind/named.conf.local
zone    "alphacyberlabs.local"   {
        type master;
        file    "/etc/bind/forward.alphacyberlabs.local";
 };

zone   "1.168.192.in-addr.arpa"        {
       type master;
       file    "/etc/bind/reverse.alphacyberlabs.local";
 };
EOT

# Create forward lookup zone file
sudo touch /etc/bind/forward.alphacyberlabs.local
cat <<EOT >> /etc/bind/forward.alphacyberlabs.local
$TTL    604800

@       IN      SOA     primary.alphacyberlabs.local. root.primary.alphacyberlabs.local. (
                              6         ; Serial
                         604820         ; Refresh
                          86600         ; Retry
                        2419600         ; Expire
                         604600 )       ; Negative Cache TTL

;Name Server Information
@       IN      NS      primary.alphacyberlabs.local.

;IP address of Your Domain Name Server(DNS)
primary IN       A      192.168.1.5

;Mail Server MX (Mail exchanger) Record
alphacyberlabs.local. IN  MX  10  mail.alphacyberlabs.local.

;A Record for Host names
www     IN       A       192.168.1.50
mail    IN       A       192.168.1.60

;CNAME Record
ftp     IN      CNAME    www.alphacyberlabs.local.
EOT

# Create reverse lookup zone file
sudo touch /etc/bind/reverse.alphacyberlabs.local
cat <<EOT >> /etc/bind/reverse.alphacyberlabs.local
$TTL    604800
@       IN      SOA     alphacyberlabs.local. root.alphacyberlabs.local. (
                             21         ; Serial
                         604820         ; Refresh
                          864500        ; Retry
                        2419270         ; Expire
                         604880 )       ; Negative Cache TTL

;Your Name Server Info
@       IN      NS      primary.alphacyberlabs.local.
primary IN      A       192.168.1.40

;Reverse Lookup for Your DNS Server
40      IN      PTR     primary.alphacyberlabs.local.

;PTR Record IP address to HostName
50      IN      PTR     www.alphacyberlabs.local.
60      IN      PTR     mail.alphacyberlabs.local.
EOT

# Apply changes
sudo systemctl restart bind9
sudo systemctl enable bind9
sudo ufw allow 53
