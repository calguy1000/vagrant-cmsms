#!/bin/sh
echo "Ensuring mysql root user has grant option"
mysql -u root < /vagrant/provision/mysql_fix_once.sql

echo "Creating the dflt database with password: dflt"
mysql -u root < /vagrant/provision/mysql_create_dflt_db.sql

echo "Ensuring some necessary tools are in place"
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -qy subversion zip openssh-client

echo "Adjusting PHP settings"
echo "phar.readonly = Off" >> /etc/php/5.6/apache2/php.ini
echo "sendmail_path = \"/usr/local/bin/mailhog sendmail test@localhost.localdomain\"" >> /etc/php/5.6/apache2/php.ini
echo "phar.readonly = Off" >> /etc/php/5.6/cli/php.ini
echo "phar.readonly = Off" >> /etc/php/7.0/apache2/php.ini
echo "sendmail_path = \"/usr/local/bin/mailhog sendmail test@localhost.localdomain\"" >> /etc/php/7.0/apache2/php.ini
echo "phar.readonly = Off" >> /etc/php/7.0/cli/php.ini
echo "phar.readonly = Off" >> /etc/php/7.1/apache2/php.ini
echo "sendmail_path = \"/usr/local/bin/mailhog sendmail test@localhost.localdomain\"" >> /etc/php/7.1/apache2/php.ini
echo "phar.readonly = Off" >> /etc/php/7.0/cli/php.ini
echo "phar.readonly = Off" >> /etc/php/7.2/apache2/php.ini
echo "sendmail_path = \"/usr/local/bin/mailhog sendmail test@localhost.localdomain\"" >> /etc/php/7.2/apache2/php.ini
echo "phar.readonly = Off" >> /etc/php/7.2/cli/php.ini
echo "opcache.enable = 1" > /var/www/.user.ini
echo "opcache.enable = 1" > /var/www/html/.user.ini

echo "Setting up MailHog"
wget -O /usr/local/bin/mailhog https://github.com/mailhog/MailHog/releases/download/v0.2.0/MailHog_linux_amd64 -o /dev/null && chmod +x /usr/local/bin/mailhog
echo "/usr/local/bin/mailhog" >> /etc/rc.local


echo "Installing cmscli"
wget -O /usr/local/bin/cmscli http://dev.cmsmadesimple.org/download_cmscli.php -o /dev/null && chmod +x /usr/local/bin/cmscli

## temporary
cp /vagrant/cmscli.phar /usr/local/bin/cmscli && chmod +x /usr/local/bin/cmscli

echo "Cleaning www directory, preparing for new install"
if [ ! -d /var/www/html ]; then
   mkdir /var/www/html
   echo "Options +Indexes" > /var/www/html/.htaccess
   chown -R www-data.www-data /var/www/html
fi
cd /var/www/html
rm -rf ./*

#echo "Downloading CMSMS"
cmscli cmsms-download -Zx install.php
chown -R www-data.www-data .

#Setting up /home/vagrant/htdocs
rm /home/vagrant/htdocs
mkdir /home/vagrant/htdocs
chown vagrant.vagrant /home/vagrant/htdocs

