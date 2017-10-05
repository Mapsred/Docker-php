FROM php:7.0-fpm

RUN apt-get update && apt-get install -y libicu-dev zlib1g-dev 

RUN docker-php-source extract \
    && docker-php-ext-install intl mbstring mysqli zip \
    && docker-php-source delete \
    && php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer
