#!/bin/sh

mkdir -p /docker-registry/auth
mkdir -p /docker-registry/data
cd docker-registry/auth

echo 'Give username for your private docker registry'
read username
sleep 1
htpasswd -Bc registry.password $username

