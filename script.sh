#!/bin/bash

cp .env.example .env

# config name database
sed -i -e 's/DB_DATABASE=laravel//g' .env
echo -n "Enter a database name > "
read database
sed  -i "12i  DB_DATABASE=$database" .env

# config username
sed -i -e 's/DB_USERNAME=root//g' .env
echo -n "Enter a  username > "
read username
sed  -i "12i  DB_DATABASE=$username" .env

# config password
sed -i -e 's/DB_PASSWORD=//g' .env
echo -n "Enter  password > "
read password
sed  -i "12i  DB_DATABASE=$password" .env

echo "Server Ready"
 php artisan serve &
echo "Migration Started" 
 php artisan migrate &
echo "migration Finished Successfuly" 
echo "Queue Started"
 php artisan queue:work --daemon --timeout=3000 &
