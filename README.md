# Jenkins Docker with Go

Jenkins docker comes with golang installed.

## Install

Use docker compose to spin everything up.

## Configuration

### Credential

Default user is `admin` and password is `123456`. You can change it to whatever you want by editing environment variables in `docker-compose.yml`.

### Jenkins Plugins

List of to-be-installed jenkins plugins is in `./docker/jenkins/data/plugins.txt`. You can add or remove plugins as you want.

Have fun!