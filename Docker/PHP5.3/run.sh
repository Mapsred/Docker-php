#!/bin/bash

#PHP Config
sed -i 's/^;\(date\.timezone\) =\s*$/\1 = "Europe\/Paris"/g' /etc/php5/apache2/php.ini
sed -i "s/^\(short_open_tag\) = .*$/\1 = On/g" /etc/php5/apache2/php.ini
sed -i "s/^\(max_execution_time\) = .*$/\1 = 1200/g" /etc/php5/apache2/php.ini
sed -i 's/memory_limit = .*/memory_limit = 2048M/' /etc/php5/apache2/php.ini

sed -i 's/^\(post_max_size\) = .*$/\1 = 128M/g' /etc/php5/apache2/php.ini
sed -i 's/^\(upload_max_filesize\) = .*$/\1 = 1024M/g' /etc/php5/apache2/php.ini

#Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
composer self-update

#Work directory
chgrp www-data /var/www
