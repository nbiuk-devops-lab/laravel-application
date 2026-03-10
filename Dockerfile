# ---------- Frontend build stage ----------
FROM node:20-alpine AS assets
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build


# ---------- PHP application stage ----------
FROM php:8.3-fpm-alpine

# install system packages + nginx
RUN apk add --no-cache \
    nginx \
    bash \
    curl \
    git \
    unzip \
    icu-dev \
    oniguruma-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev

# install PHP extensions
RUN docker-php-ext-install \
        pdo \
        intl \
        mbstring \
        zip \
        opcache

# install composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# copy application source
COPY . .

# copy compiled frontend assets
COPY --from=assets /app/public/build ./public/build

# install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# nginx config
COPY docker/nginx/nginx.conf /etc/nginx/http.d/default.conf

# permissions for Laravel
RUN chown -R www-data:www-data \
    /var/www/html/storage \
    /var/www/html/bootstrap/cache

# expose HTTP port
EXPOSE 80

# start php-fpm + nginx
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
