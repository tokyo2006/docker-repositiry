#!/usr/bin/env bash
set -e

deps(){
	echo "Installing dependencies"
	apk --update add unzip 
        rm -rf /var/cache/apk/* 
        mkdir /s3ninja
        cd /s3ninja
        wget https://oss.sonatype.org/content/groups/public/com/scireum/s3ninja/2.7/s3ninja-2.7-zip.zip
        unzip s3ninja-2.7-zip.zip
        rm -rf s3ninja-2.7-zip.zip
        chmod 777 -R data
        
}

deps
