# Docker LNMP

Deploy LNMP(Linux, Nginx, MySQL, PHP7.2) using docker.

### Build and Run

Make sure you had `docker` and `docker-compose`.

```bash
# Install docker
curl -sSL https://get.docker.com/ | sh
# You may want manage docker as a non-root user
# To create the docker group and add your user
sudo groupadd docker
sudo usermod -aG docker $USER
groups $USER
# You may need reboot your server

# Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

Clone project and build.

```bash
git clone https://github.com/hughshen/docker-lnmp.git lnmp && cd lnmp
docker-compose up -d
```

After built you can open with `http://your_ip:9000` to the index page and phpMyAdmin access in `http://your_ip:9001`.

### PHP Composer

```bash
docker pull composer
docker run --rm --interactive --tty \
    --volume /path/to/www:/app \
    --volume /path/to/www/.composer:/tmp \
    composer install
```

### MySQL

```bash
# Backup
docker exec MYSQL_CONTAINER /usr/bin/mysqldump -u root --password=your_password DATABASE > backup.sql
# Restore
cat backup.sql | docker exec -i MYSQL_CONTAINER /usr/bin/mysql -u root --password=your_password DATABASE
```

### License

MIT
