#!/bin/bash

apt-get update
apt-get upgrade -y
apt-get install -y --force-yes git zip autoconf discount python-pygments vim dh-make build-essential devscripts
apt-get autoremove -y

git clone https://github.com/rerun/rerun.git

cp rerun/etc/bash_completion.sh /etc/bash_completion.d/
cp /vagrant/rerun_profile.sh /etc/profile.d

chown -R vagrant:vagrant rerun
