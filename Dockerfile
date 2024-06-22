# ----------------------------------------------------
# Application build stage
# @see https://cloud.google.com/run/docs/quickstarts/build-and-deploy/deploy-php-service
FROM php:8.1-apache AS docless

ENV PORT=80

# Configure PHP for Cloud Run.
# Precompile PHP code with opcache.
RUN docker-php-ext-install -j "$(nproc)" opcache
RUN set -ex; \
  { \
    echo "; Cloud Run enforces memory & timeouts"; \
    echo "memory_limit = -1"; \
    echo "max_execution_time = 0"; \
    echo "; File upload at Cloud Run network limit"; \
    echo "upload_max_filesize = 32M"; \
    echo "post_max_size = 32M"; \
    echo "; Configure Opcache for Containers"; \
    echo "opcache.enable = On"; \
    echo "opcache.validate_timestamps = Off"; \
    echo "; Configure Opcache Memory (Application-specific)"; \
    echo "opcache.memory_consumption = 32"; \
  } > "$PHP_INI_DIR/conf.d/cloud-run.ini"

# Use the PORT environment variable in Apache configuration files.
# https://cloud.google.com/run/docs/reference/container-contract#port
COPY vhost.conf /etc/apache2/sites-available/000-default.conf
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# Configure PHP for target environment.
# https://github.com/docker-library/docs/blob/master/php/README.md#configuration
# RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

WORKDIR /var/www/html
COPY src/ ./

ARG NOVA_LICENSE_KEY
ENV NOVA_USERNAME=diversification-tech@deezer.com

RUN apt-get update -y && apt-get install -y openssl zip libzip-dev unzip git \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && docker-php-ext-install pdo pdo_mysql zip \
    && composer config http-basic.nova.laravel.com "$NOVA_USERNAME" "$NOVA_LICENSE_KEY" \
    && composer install --no-dev
RUN chown -R www-data:www-data /var/www/html && a2enmod http2 rewrite
RUN php artisan nova:publish

# ----------------------------------------------------
# Additional documentation generation step for dev
FROM docless AS docfull

RUN composer install --dev
RUN php artisan scribe:generate