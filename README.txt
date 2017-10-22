Vagrant config to create a CMSMS installation

Based On

Requires
   landrush vagrant plugin

Packages Available
   cmscli
   ssh
   unzip
   subversion
   git
   - multiple php versions
  

Connecting:
   HTTP:  localhost:8080
   SSH:   localhost:2222
   or just "vagrant ssh" 

Usernames/Passwords
   vagrant/vagrant
   mysql/
   root/

Synced Folders
   ./  is synced to /vagrant
   ./www is synced to /var/www
  
Special folders:
   /home/vagrant/htdocs is linked (bindfs mount) to /var/www  
   - vagrant user (via ssh) can modify files in ~/htdocs to effect the website
   
Databases:
   dflt  u: dflt p: dflt

