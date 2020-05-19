#!/bin/sh

#!/bin/bash
sleep 5s
 apt-get update

sleep 5s
 apt-get -y install make build-essential curl git zlib1g-dev python2.7 libkrb5-dev

sleep 5s
 mkdir -p coco
cd coco
 git clone https://github.com/codecombat/codecombat.git

sleep 5s
 wget https://nodejs.org/dist/latest-v8.x/node-v8.17.0.tar.gz
 tar xfz node-v8.17.0.tar.gz
cd node-v8.17.0
 ./configure
 make
 make install

sleep 5s
npm -v
sleep 5s

cd ~/coco/codecombat
 npm config set registry https://registry.cnpmjs.org
 npm config set python python2.7
 npm install
 npm run proxy
