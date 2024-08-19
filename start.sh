#!/bin/bash

# Переменные
NETWORK_NAME="zachet-network"
DB_CONTAINER_NAME="zachet-db"
WEB_CONTAINER_NAME="zachet-web"
DB_IMAGE="postgres:16.4"
WEB_IMAGE="nginx:1.26"
DB_PASSWORD="123"
DB_NAME="polzakdb"
DB_USER="polzak"

# Создание отдельной сети
docker network create $NETWORK_NAME

# Запуск контейнера базы данных
docker run -d \
    --name $DB_CONTAINER_NAME \
    --network $NETWORK_NAME \
    -e POSTGRES_PASSWORD=$DB_PASSWORD \
    -e POSTGRES_USER=$DB_USER \
    -e POSTGRES_DB=$DB_NAME \
    $DB_IMAGE

# Запуск контейнера веб-приложения
docker run -d \
    --name $WEB_CONTAINER_NAME \
    --network $NETWORK_NAME \
    -p 8080:80 \
    $WEB_IMAGE

echo "Веб-приложение запущено на http://localhost:8080"
