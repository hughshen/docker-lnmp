FROM php:7-fpm

RUN apt-get update && apt-get install -y \
        bash \
        curl \
        git \
        zip \
        unzip \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libcurl3 \
        libcurl4-openssl-dev \
    && docker-php-ext-install -j$(nproc) iconv mysqli pdo pdo_mysql zip mbstring curl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install redis-3.1.4 \
    && docker-php-ext-enable redis \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

