#!/usr/bin/env bash

cd /home/minecraft/repository || exit 1

docker exec minecraft rcon-cli stop
docker compose down
git pull
docker compose up -d
