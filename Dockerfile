FROM node:20-alpine AS assets
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM php:8.3-fpm-alpine

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

RUN docker-php-ext-install \
        pdo \
        intl \
        mbstring \
        zip \
        opcache

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY . .

COPY --from=assets /app/public/build ./public/build

RUN composer install --no-dev --optimize-autoloader

COPY docker/nginx/nginx.conf /etc/nginx/http.d/default.conf

RUN chown -R www-data:www-data \
    /var/www/html/storage \
    /var/www/html/bootstrap/cache

EXPOSE 80

CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]

ENTRYPOINT ["/entrypoint.sh"]
CMD []
