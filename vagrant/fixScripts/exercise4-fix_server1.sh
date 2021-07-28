#!/bin/bash
#add fix to exercise4-server1 here

sudo -u vagrant touch /home/vagrant/.ssh/config
#sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo -e "Host server2\n    HostName 192.168.100.11" >> /home/vagrant/.ssh/config
#sudo systemctl restart sshd