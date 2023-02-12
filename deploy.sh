#!/usr/bin/env bash

cd /home/minecraft/repository || exit 1

docker compose down
git pull
docker compose up -d
