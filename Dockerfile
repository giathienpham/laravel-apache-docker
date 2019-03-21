FROM php:7.3.3-apache

ENV APACHE_DOCUMENT_ROOT /var/www/html/LaravelTesto/public/

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

ADD ./LaravelTesto /var/www/html/LaravelTesto/
COPY ./LaravelTesto/ /var/www/html/LaravelTesto/

RUN chown -R $USER:www-data /var/www/html/LaravelTesto/storage
RUN chmod -R 775 /var/www/html/LaravelTesto/storage

RUN docker-php-ext-install pdo pdo_mysql

RUN a2enmod rewrite