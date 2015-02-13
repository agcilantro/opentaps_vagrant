#!/usr/bin/env bash

echo "Getting update:"
apt-get update > /dev/null

echo "Installing git"
apt-get install -y git > /dev/null
# apt-get install -y php5
# apt-get install -y apache2

# if ! [ -L /var/www ]; then
#	rm -rf /var/www
#	ln -fs /vagrant /var/www


# installs webupd8team repository to install java jdk

echo "Installing webupd8team repository for java:"


echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

# apt-get install -y oracle-java7-installer

# to automate dialog with oracle installer:
echo "Updating after adding repository:"
apt-get update > /dev/null

echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections > /dev/null
echo "installing the java7 installer:"
apt-get install -y oracle-java7-installer > /dev/null


# git config --global user.name "agcilantro"
# git config --global user.email agcilantro@gmail.com
#wget http://downloads.sourceforge.net/project/opentaps/opentaps%201.5/opentaps-1.5.0.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fopentaps%2Ffiles%2Fopentaps%25201.4%2F&ts=1423709025&use_mirror=colocrossing opentaps
echo "change to vagrant folder and clone opentaps from git:"
cd /vagrant 
 git clone --recursive --verbose https://gitorious.org/opentaps/agcilantros-integratingweb-opentaps.git opentaps

# change ownership of opentaps folder to vagrant:opentaps, chmod opentaps folder to 700
sudo addgroup opentaps
sudo adduser vagrant opentaps
sudo chown -R vagrant:opentaps /vagrant/opentaps
sudo chmod 700 /vagrant/opentaps

# cd /vagrant/opentaps



# ./ant
# ./ant run-install
# ./ant load-extseed
# ./ant start
# ./startofbiz.sh










