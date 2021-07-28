#!/bin/bash
#add fix to exercise5-server2 here
sudo apt-get update
sudo apt-get install sshpass
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd

sudo -u vagrant ssh-keygen -f /home/vagrant/.ssh/id_rsa -N ""
sudo -u vagrant touch /home/vagrant/.ssh/known_hosts
sudo -u vagrant ssh-keyscan -H 192.168.100.10 >> /home/vagrant/.ssh/known_hosts

sudo -u vagrant sshpass -p "vagrant" ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.100.10

sudo -u vagrant sshpass -p "vagrant" ssh vagrant@192.168.100.10 "/home/vagrant/exercise5-fix"

sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sudo systemctl restart sshd