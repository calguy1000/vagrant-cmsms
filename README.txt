Vagrant config to create a CMSMS installation

Based On
   ArminVieweg/ubuntu-xenial64-lamp

Features
   Uses Ubuntu 16.04 LTS
   Has multiple versions of PHP.  Default is PHP 7.1
   mailhog is installed
   phar.readonly is disabled
   opcache is enabled

Packages Available
   cmscli
   ssh
   unzip
   subversion
   git

Instructions:
   vagrant up
   browse to "http://192.168.1.200/' ... cmsms installation script is available as install.php
  
Connecting:
   Private IP Address:  192.168.1.200
   HTTP:  localhost:8080
   SSH:   localhost:2222
   or just "vagrant ssh" 

Usernames/Passwords
   mysql:        user: root    password: none
   root user:    user: root    password: none
   vagrant user: user: vagrant password: vagrant

Synced Folders
   ./  is synced to /vagrant
   ./www is synced to /var/www
  
Special folders:
   /home/vagrant/htdocs is linked (bindfs mount) to /var/www  
   The vagrant user (via ssh or "vagrant ssh") can modify files in ~/htdocs to effect the website.
   
Databases:
   name:  dflt  
   user:  dflt 
   pass:  dflt

