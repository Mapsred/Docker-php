MorningCheck - Docker 
======

Installation
------------

This dockerfile create an image based on `debian:stretch`

It contains a full LAMP configuration with : 
* Debian 9 Stretch
* Apache 2
* MariaDB 10.1
* PHP 7.0 

You need to copy your public/private key to docker/config/git


To create the image run this command : 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
docker build -t debian_stretch .
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To use MySQL outside the container (ex: phpmyadmin), 
you need to run the following lines on the MySQL prompt

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mysql
use mysql;
UPDATE user SET Host=null, authentication_string=PASSWORD("Password"), password_expired = 'N' WHERE User='root';
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


