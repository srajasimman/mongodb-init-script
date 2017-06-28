#!/bin/sh
cd /opt
wget -c http://downloads.mongodb.org/linux/mongodb-linux-x86_64-3.2.3.tgz
tar -xzvf mongodb-linux-*
rm mongodb-linux-*.tgz -f
mv mongodb-linux-* /opt/mongodb
mkdir -p /data/db/mongodb
mkdir -p /opt/mongodb/config
touch /data/db/mongodb.log
cat mongodb > /etc/init.d/mongodb
chmod +x /etc/init.d/mongodb
cat mongodb.conf > /opt/mongodb/config/mongodb
ln -s /opt/mongodb/config/mongodb /etc/mongod.conf
ln -s /opt/mongodb/bin/mongod /usr/bin/mongod
useradd -M -r --home-dir /opt/mongodb mongodb
chown mongodb:mongodb -R /data/db/
chkconfig --add mongodb
chkconfig mongodb on
service mongodb stop
service mongodb start
service mongodb status
