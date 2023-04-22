#!/bin/bash

echo "[1] Install java"
sleep 2
apt install openjdk-11-jdk

echo "[2] Make folder /app"
sleep 2
mkdir /app && cd $_

echo "[3] Download tar"
sleep 2
wget https://sonatype-download.global.ssl.fastly.net/repository/downloads-prod-group/3/nexus-3.39.0-01-unix.tar.gz
tar -xvzf  nexus-3.39.0-01-unix.tar.gz

echo "[4] Move folder"
sleep 2
mv nexus-3.39.0-01 nexus

echo "[5] Create user nexus"
sleep 2
adduser nexus

echo "[6] Set permissions to nexus user"
sleep 2
chown -R nexus:nexus /app/nexus
chown -R nexus:nexus /app/sonatype-work

echo "[6] Config nexus user"
sleep 2
echo 'run_as_user="nexus"' > /app/nexus/bin/nexus.rc

echo "[#] DONE [#]"
echo "[#] Run /app/nexus/bin/nexus start for start"
