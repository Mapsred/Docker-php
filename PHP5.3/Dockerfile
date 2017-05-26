#Ubuntu Trusty 12.04
FROM ubuntu:precise
MAINTAINER beclood <all@beclood.com>

RUN apt-get update && apt-get install -y php5 php5-mysql mysql-server mercurial curl wget vim git
#Enable apache mods
RUN a2enmod rewrite proxy proxy_http

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

#Add phpinfo to the index (/etc/apache2/sites-available/default)
RUN rm /var/www/index.html && echo "<?php phpinfo();" > /var/www/index.php

ADD run.sh /run.sh
ADD start.sh /start.sh
RUN chmod 755 /*.sh
CMD ./run.sh
CMD ./start.sh

