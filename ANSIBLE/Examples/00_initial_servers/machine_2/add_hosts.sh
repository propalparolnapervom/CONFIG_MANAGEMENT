echo "echo 127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4 > /etc/hosts" >> /tmp/add_host_name
echo "echo ::1         localhost localhost.localdomain localhost6 localhost6.localdomain6 >> /etc/hosts" >> /tmp/add_host_name
echo "echo 192.168.50.10 control-host >> /etc/hosts" >> /tmp/add_host_name
echo "echo 192.168.50.20 remote-host >> /etc/hosts" >> /tmp/add_host_name
bash /tmp/add_host_name
rm /tmp/add_host_name

yum install -y telnet
