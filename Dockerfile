FROM alpine:3.11

# https://github.com/codecasts/php-alpine
# trust this project public key to trust the packages.
ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update add ca-certificates \
    && echo "https://dl.bintray.com/php-alpine/v3.11/php-7.4" >> /etc/apk/repositories \
    && apk --update add \
        php \
        php-fpm \
        php-mbstring \
        php-pdo \
        php-pdo_mysql \
        php-mysqli \
        php-curl \
        php-openssl \
        php-gettext \
        php-bcmath \
        php-zip \
        php-json \
        php-soap \
        php-zlib \
        php-xml \
        php-xmlreader \
        php-dom \
        php-ftp \
        php-ctype \
        php-gd \
        php-intl \
        php-session \
        php-iconv \
        php-exif \
        php-redis \
        php-opcache \
    && set -x \
    && addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -G www-data www-data \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && rm -rf /var/cache/apk/*

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]
