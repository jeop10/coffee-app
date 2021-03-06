A simple POC of a coffee-shop

## Setup process

First, you need to clone this repo. After that you will need to run the `setup.sh`
script this will pull the other 2 needed repos for this project to work, [Fronted](https://github.com/jeop10/coffee-frontend) and [Backend](https://github.com/jeop10/coffee-backend).

After that, assuming that you have installed docker on your server you should run
`docker-compose up`. If you desire to run in detached, sure to add the `-d` tag.

After the all the containers all up make sure to run the following commands for the frontend

```sh
 sudo docker-compose exec laravel-frontend cp /var/www/html/.env.example /var/www/html/.env
 sudo docker-compose exec laravel-frontend php /var/www/html/artisan key:generate
```

And for the backend 

```sh
 sudo docker-compose exec laravel-backend cp /var/www/html/.env.example /var/www/html/.env
 sudo docker-compose exec laravel-backend php /var/www/html/artisan key:generate
```

Those commands will create the necessary .env file and generate the key that laravel needs to work.

After that, you should be able to navigate to the app on port 80.

---

### Some problems

In order to run the laravel database migrations you will need to enter the container and execute the necessary commands.

Here is an example 

```shell

#Accessing a container
docker exec -it coffee-app_laravel-backend_1 /bin/sh

#Once inside the container running the migrations
php artisan migrate:fresh
```