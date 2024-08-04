#!/bin/bash

# create network
docker network create zachet

# run container
docker run -d --name webapp --network zachet nginx
docker run -d --name database --network zachet postgres
chmod +x .sh