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
        pdo_mysql \
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

CMD ["php-fpm"]
