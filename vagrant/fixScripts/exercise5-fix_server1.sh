#!/bin/bash
#add fix to exercise5-server1 here
sudo apt-get update
sudo apt-get install sshpass
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd

sudo -u vagrant ssh-keygen -f /home/vagrant/.ssh/id_rsa -N ""

echo -e "" > /home/vagrant/exercise5-fix
echo -e "#!/bin/bash">> /home/vagrant/exercise5-fix
echo -e "sudo -u vagrant touch /home/vagrant/.ssh/known_hosts" >> /home/vagrant/exercise5-fix
echo -e "sudo -u vagrant ssh-keyscan -H 192.168.100.11 >> /home/vagrant/.ssh/known_hosts" >> /home/vagrant/exercise5-fix
echo -e "sshpass -p "vagrant" ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.100.11" >> /home/vagrant/exercise5-fix
echo -e "sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config" >> /home/vagrant/exercise5-fix
echo -e "sudo systemctl restart sshd" >> /home/vagrant/exercise5-fix

chmod a+x /home/vagrant/exercise5-fix
