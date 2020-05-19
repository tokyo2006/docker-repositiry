#!/bin/bash

expect -c "
spawn ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key
    expect {  
        \"*key*\" {send \"\r\"; exp_continue}     
                \"*passphrase*\" {send \"\r\"; exp_continue}     
                \"*again*\" {send \"\r\";}     
    }
"  

expect -c "
spawn ssh-keygen -t ecdsa -b 256 -f /etc/ssh/ssh_host_ecdsa_key
    expect {  
        \"*key*\" {send \"\r\"; exp_continue}     
                \"*passphrase*\" {send \"\r\"; exp_continue}     
                \"*again*\" {send \"\r\";}     
    }
"

expect -c "
spawn ssh-keygen -t ed25519 -b 2048 -f /etc/ssh/ssh_host_ed25519_key
    expect {  
        \"*key*\" {send \"\r\"; exp_continue}     
                \"*passphrase*\" {send \"\r\"; exp_continue}     
                \"*again*\" {send \"\r\";}     
    }
"