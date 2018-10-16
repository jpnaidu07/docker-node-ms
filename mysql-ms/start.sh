#!/bin/sh

echo "Starting DB...."
docker run --name db -d -e MYSQL_ROOT_PASSWORD=123 -e MYSQL_DATABASE=users -e MYSQL_USER=users_service -e MYSQL_PASSWORD=123 -p 3306:3306 mysql:latest


echo "startinggggggggggggggggggg............"
docker exec db mysqladmin --silent --wait=30 -uusers_service -p123 ping || exit 1


echo "Settinggggg init data...."
docker exec -i db mysql -uusers_service -p123 users < setup.sql