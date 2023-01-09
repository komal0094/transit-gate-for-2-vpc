#!/bin/bash
   
   apt update -y
   apt install nginx -y
   apt install php-fpm php-mysql -y
   cd /var/www/html
   wget http://wordpress.org/latest.tar.gz
   tar xvzf latest.tar.gz






   #hostnamectl set-hostname ${each.value["hostname"]}