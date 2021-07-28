#!/bin/bash
#add fix to exercise4-server2 here

sudo -u vagrant touch /home/vagrant/.ssh/config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo -e "Host server1\n    HostName 192.168.100.10" >> /home/vagrant/.ssh/config
sudo systemctl restart sshd