#!/usr/bin/env bash

apt-get update

apt-get install -y git
apt-get install -y php5
apt-get install -y apache2

if ! [ -L /var/www ]; then
	rm -rf /var/www
	ln -fs /vagrant /var/www


# installs webupd8team repository to install java jdk



echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

# apt-get install -y oracle-java7-installer

# to automate dialog with oracle installer:
apt-get update

echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get install -y oracle-java7-installer


git config --global user.name "agcilantro"
git config --global user.email agcilantro@gmail.com
git clone --recursive https://gitorious.org/opentaps/opentaps.git opentaps

# change ownership of opentaps folder to vagrant:opentaps, chmod opentaps folder to 700
sudo addgroup opentaps
sudo adduser vagrant opentaps
sudo chown -R vagrant:opentaps opentaps
sudo chmod 700 opentaps

cd opentaps



# ./ant
# ./ant load-demo
# ./ant load-extseed
# ./ant start
./startofbiz.sh









fi
