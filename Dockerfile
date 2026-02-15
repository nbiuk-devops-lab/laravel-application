FROM node:20-alpine AS assets
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM php:8.3-fpm-alpine

RUN apk add --no-cache \
    bash \
    curl \
    git \
    unzip \
    icu-dev \
    oniguruma-dev \
    libzip-dev \
    && docker-php-ext-install \
        pdo \
        intl \
        mbstring \
        zip \
        opcache

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# copy application source
COPY . .

# copy built frontend assets only
COPY --from=assets /app/public/build ./public/build

# copy entrypoint
COPY docker/php/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# fix Laravel writable directories permissions (build time fallback)
RUN chown -R www-data:www-data \
    /var/www/html/storage \
    /var/www/html/bootstrap/cache

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
