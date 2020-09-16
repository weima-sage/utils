#!/usr/local/bin/bash
echo "Shutting down containers..."
docker stop $(docker ps -qa)
echo "Cleaning containers..."
docker container prune -f
echo "Cleaning volumes..."
docker volume prune -f
echo "Cleaning images..."
docker image prune -f
echo "Cleaning networks..."
docker network prune -f
