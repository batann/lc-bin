#!/bin/bash

# Update package lists
apt update -y

# Install LAMP stack
apt install -y apache2 mariadb-server php libapache2-mod-php php-mysql php-gd php-mbstring php-zip php-intl php-curl php-imagick

# Secure MariaDB
mysql_secure_installation

# Create Nextcloud database and user
mysql -u root -p
CREATE DATABASE nextcloud;
CREATE USER 'nextclouduser'@'localhost' IDENTIFIED BY 'your_strong_password';
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextclouduser'@'localhost';
FLUSH PRIVILEGES;
exit

# Download Nextcloud
wget https://download.nextcloud.com/server/latest/nextcloud.zip
unzip nextcloud.zip
mv nextcloud /var/www/html/

# Configure Apache for Nextcloud
cat << EOF > /etc/apache2/sites-available/nextcloud.conf
<VirtualHost *:80>
    ServerName your_domain.com
    DocumentRoot /var/www/html/nextcloud

    <Directory /var/www/html/nextcloud>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF

a2ensite nextcloud.conf
a2enmod rewrite
systemctl restart apache2

# Complete Nextcloud installation
cd /var/www/html/nextcloud
php occ:install --database mysql --database-user nextclouduser --database-pass your_strong_password --database-name nextcloud --admin-user admin --admin-pass your_strong_password

# Additional configuration (optional)
# Consider using HTTPS, enabling additional Nextcloud apps, and configuring file permissions

