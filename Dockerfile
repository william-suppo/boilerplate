FROM php:8.1-apache-buster as dev

# Install packages
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    libzip-dev \
    libcurl4-openssl-dev \
    zip \
    unzip

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd zip curl intl

# Get latest Composer
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

# Copy vhost config
COPY vhost.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

FROM dev as prod

# Copy app source code
COPY --chown=www-data:www-data . /var/www/html

USER www-data

# Install composer dependencies
RUN composer install --prefer-dist --optimize-autoloader --no-interaction

# Copy .env file
COPY --chown=www-data:www-data .env.example /var/www/html/.env
