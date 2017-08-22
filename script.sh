
#!/bin/bash


sudo apt-get install git-core -y
git clone https://github.com/DogushanKaya/kartacavagrant.git



# Apache2
apt-get install apache2 -y

# MySQL 
echo "Preparing MySQL"
apt-get install debconf-utils -y 
debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"

echo "Installing MySQL"
apt-get install mysql-server -y


sudo cp kartacavagrant/phpapp/* /var/www/html
sudo rm /var/www/html/index.html
sed -i "/$mysql_password = '';/c\$mysql_password = '1234'\;" /var/www/html/conn.php
sudo mysql -u root -p1234 < /var/www/html/schema.sql

# php
apt-get install -y php5 php5-mysql php-pear 

sudo service apache2 restart




