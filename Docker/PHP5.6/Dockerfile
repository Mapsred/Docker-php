#Ubuntu Xenial 16.04
FROM ubuntu:xenial
MAINTAINER maps_red <maps_red@yahoo.fr>

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y language-pack-en-base &&\
    export LC_ALL=en_US.UTF-8 && \
    export LANG=en_US.UTF-8


RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y software-properties-common
RUN DEBIAN_FRONTEND=noninteractive LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

RUN DEBIAN_FRONTEND=noninteractive LC_ALL=en_US.UTF-8 \
    echo 'mysql-server mysql-server/root_password password root'| debconf-set-selections && \
    echo 'mysql-server mysql-server/root_password_again password root'| debconf-set-selections 

RUN DEBIAN_FRONTEND=noninteractive LC_ALL=en_US.UTF-8 \
    apt-get update && apt-get install -y \
    php5.6 php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml php5.6-curl php5.6-cli php5.6-intl php5.6-zip curl wget git mysql-server

#Enable apache mods
RUN a2enmod rewrite proxy proxy_http

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

#Add phpinfo to the index (/etc/apache2/sites-available/default)
RUN rm /var/www/html/index.html && echo "<?php phpinfo();" > /var/www/html/index.php

ADD run.sh /run.sh
ADD start.sh /start.sh
RUN chmod 755 /*.sh
CMD ./run.sh
CMD ./start.sh

