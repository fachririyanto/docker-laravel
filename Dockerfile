FROM php:8.2-apache

WORKDIR /var/www/html

# Mod Rewrite
RUN a2enmod rewrite

# Install Utilities
RUN apt-get update -y && apt-get install -y libicu-dev libpq-dev libzip-dev zip unzip git

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# RUN Docker
RUN docker-php-ext-install intl pdo pdo_pgsql gettext pdo_mysql