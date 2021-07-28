#!/bin/bash
#add fix to exercise3 here
sudo sed -i 's/Require all denied/Require all granted/g' /etc/apache2/sites-available/000-default.conf
sudo systemctl restart apache2
sudo chmod 755 /var/www/html/
sudo chmod 644 /var/www/html/index.html
sudo chown -R www-data:www-data /var/www/html/