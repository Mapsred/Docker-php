FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    composer \
    curl \
    gnupg \
    gnupg2 \
    gnupg1 \
    vim \
    wget \
    nano \
    mysql-server \
    apache2 \
    libapache2-mod-php7.0 
    
#PHP Modules
RUN apt-get install -y \
    php-curl \
    php-xml \
    php-mbstring \
    php-mcrypt \
    php-mysql \
    php-cli \
    php-intl \
    php-zip \
    php-apcu \
    php-xdebug

#NodeJS and NPM
RUN curl -sL https://deb.nodesource.com/setup_6.x > setup_6.x
RUN chmod +x setup_6.x
RUN ./setup_6.x

RUN apt-get install -y nodejs
RUN npm install -g bower

COPY config/bashrc /root/.bashrc
COPY config/vimrc /root/.vimrc


#Symfony Installer
RUN mkdir -p /usr/local/bin
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

#Apache config
RUN a2enmod rewrite
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
#Add phpinfo to the index (/etc/apache2/sites-available/default)
RUN rm /var/www/html/index.html && echo "<?php phpinfo();" > /var/www/html/index.php
COPY config/vhost /etc/apache2/sites-available/isolonice-services.conf

#PHP Config
RUN sed -i "s/^;date.timezone =$/date.timezone = \"Europe\/Paris\"/" /etc/php/7.0/cli/php.ini /etc/php/7.0/apache2/php.ini
RUN sed -i "s/^\(short_open_tag\) = .*$/\1 = On/g" /etc/php/7.0/cli/php.ini /etc/php/7.0/apache2/php.ini
RUN sed -i "s/^\(max_execution_time\) = .*$/\1 = 1200/g" /etc/php/7.0/cli/php.ini /etc/php/7.0/apache2/php.ini
RUN sed -i 's/memory_limit = .*/memory_limit = 2048M/' /etc/php/7.0/cli/php.ini /etc/php/7.0/apache2/php.ini
RUN sed -i 's/^\(post_max_size\) = .*$/\1 = 128M/g' /etc/php/7.0/cli/php.ini /etc/php/7.0/apache2/php.ini
RUN sed -i 's/^\(upload_max_filesize\) = .*$/\1 = 1024M/g' /etc/php/7.0/cli/php.ini /etc/php/7.0/apache2/php.ini

#SSH Key config
COPY config/git/id_rsa /root/.ssh/id_rsa
COPY config/git/id_rsa.pub /root/.ssh/id_rsa.pub
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/*



RUN apt-get clean

WORKDIR /root