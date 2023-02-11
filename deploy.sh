#!/usr/bin/env bash

cd /home/minecraft/repository || exit 1

screen -S "mc-server" -X stuff "say Deploying new version...$(printf \\r)"
screen -S "mc-server" -X stuff "save-all$(printf \\r)"
screen -S "mc-server" -X stuff "stop$(printf \\r)"

git pull

screen -S "mc-server" -X stuff "start$(printf \\r)"
screen -S "mc-server" -X stuff "say Deployed new version!$(printf \\r)"