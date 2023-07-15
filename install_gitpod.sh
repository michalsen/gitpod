### Not Required ###
###
### I added this to run PHP, Terminus, and Composer outside of Lando.
### To gain access to these tools, lando ssh to enter into the VM

apt-get -q update 
sudo apt-get install -y php-dev 
sudo apt-get purge -y composer 
sudo rm -rf /var/lib/apt/listshp/*  
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg  
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"  
sudo apt install docker-ce docker-ce-cli containerd.io -y 
sudo apt --fix-broken install  -y 
sudo apt install php8.1 -y

## Install Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" 
php composer-setup.php --quiet 
sudo mv composer.phar /usr/local/bin/composer 
rm -f composer-setup.php

## Install Terminus
sudo apt-get install -y php-xml
mkdir -p ~/terminus && cd ~/terminus
curl -L https://github.com/pantheon-systems/terminus/releases/download/3.2.1/terminus.phar --output terminus
chmod +x terminus
./terminus self:update
sudo ln -s ~/terminus/terminus /usr/local/bin/terminus
