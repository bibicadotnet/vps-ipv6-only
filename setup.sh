#!/bin/bash
echo -e "nameserver 2001:67c:2b0::4\nnameserver 2001:67c:2b0::6" > /etc/resolv.conf
apt install resolvconf git build-essential tayga curl -y
mkdir ~/src
cd ~/src
git clone https://github.com/toreanderson/clatd
make -C clatd install installdeps
cd
cat <<'EOF' > /etc/clatd.conf
clat-v6-addr=fd00::c1a7
proxynd-enable=false
script-up=nft "add table ip6 clatd" ; nft "add chain ip6 clatd POSTROUTING { type nat hook postrouting priority srcnat; }" ; nft "add rule ip6 clatd POSTROUTING masquerade"
script-down=nft 'delete table ip6 clatd'
EOF
sudo rm /etc/resolv.conf
echo -e "nameserver 2001:67c:2b0::4\nnameserver 2001:67c:2b0::6" > /etc/resolv.conf
sudo chattr +i /etc/resolv.conf
sysctl -p
systemctl enable clatd
service clatd start
# check 
curl 1.1.1.1
curl -4 google.com
