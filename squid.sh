#!/bin/sh

# Installation af Squid.
apt update
apt install squid -y

# Backup af original squid fil og sletning af kommenterede linjer i fil.
cp /etc/squid/squid.conf /etc/squid/squid.conf.old
grep -o '^[^#]*' squid.conf.old > squid.conf

# Indhold i modificeret squid configurations fil.
tee /etc/squid/squid.conf <<EOF
acl localnet src 10.0.0.0/8	
acl localnet src 172.16.0.0/12	
acl localnet src 192.168.0.0/16	
acl localnet src fc00::/7       
acl localnet src fe80::/10      
acl SSL_ports port 443
acl Safe_ports port 80		
acl Safe_ports port 21		
acl Safe_ports port 443		
acl Safe_ports port 70		
acl Safe_ports port 210		
acl Safe_ports port 1025-65535	
acl Safe_ports port 280		
acl Safe_ports port 488		
acl Safe_ports port 591		
acl Safe_ports port 777		
acl CONNECT method CONNECT
http_access deny !Safe_ports
http_access deny CONNECT !SSL_ports
http_access allow localhost manager
http_access deny manager
http_access deny to_localhost
http_access allow localnet
http_access allow localhost

# Egne tilføjelser
acl domains dstdomain "/etc/squid/domains.txt" 
acl keyword_block url_regex "/etc/squid/keyword_block.txt"
http_access deny localnet domains keyword_block
http_access allow localnet

http_access deny all
http_port 3128
cache_dir ufs /var/spool/squid 100 16 256
coredump_dir /var/spool/squid
refresh_pattern ^ftp:		1440	20%	10080
refresh_pattern ^gopher:	1440	0%	1440
refresh_pattern -i (/cgi-bin/|\?) 0	0%	0
refresh_pattern (Release|Packages(.gz)*)$      0       20%     2880
refresh_pattern .		0	20%	4320
EOF

# Blokering af domains - fil.
tee /etc/squid/domains.txt <<EOF
.facebook.com
.youtube.com
EOF

# Blokering af keywords - fil.
tee /etc/squid/keyword_block.txt <<EOF
facebook
youtube
EOF

# Genstart af Squid.
systemctl reload squid

# Live monitoring af logs
watch tail /var/log/squid/access.log
