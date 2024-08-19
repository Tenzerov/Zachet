#!/bin/bash

# Переменные
NETWORK="zachet-network"
DB_CONTAINER="zachet-db"
WEB_CONTAINER="zachet-web"
DB_IMAGE="postgres:16.4"
WEB_IMAGE="nginx:1.26"
DB_PASSWORD="123"
DB_NAME="polzakdb"
DB_USER="polzak"

# Создание отдельной сети
docker network create $NETWORK

# Запуск контейнера базы данных
docker run -d \
    --name $DB_CONTAINER \
    --network $NETWORK \
    -e POSTGRES_PASSWORD=$DB_PASSWORD \
    -e POSTGRES_USER=$DB_USER \
    -e POSTGRES_DB=$DB_NAME \
    $DB_IMAGE

# Запуск контейнера веб-приложения
docker run -d \
    --name $WEB_CONTAINER \
    --network $NETWORK \
    -p 8080:80 \
    $WEB_IMAGE

echo "Веб-приложение запущено на http://localhost:8080"
