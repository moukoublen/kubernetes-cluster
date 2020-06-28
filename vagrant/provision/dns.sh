systemctl stop systemd-resolved.service
systemctl disable systemd-resolved.service
sed -i.bak -e "s/^nameserver.*$//g" /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
