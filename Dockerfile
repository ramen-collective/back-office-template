# Utiliser l'image officielle PHP avec Apache
FROM php:8.2-apache

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo pdo_mysql zip

# Installer Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Définir le répertoire de travail
WORKDIR /var/www/html

# Copier les fichiers de l'application
COPY src/ .

# Installer les dépendances de l'application
RUN composer install --no-dev --optimize-autoloader

# Copier le fichier de configuration Apache pour Laravel
COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

# Activer le module rewrite d'Apache
RUN a2enmod rewrite

# Assurer les permissions correctes pour le stockage et le cache de Laravel
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Exposer le port 80
EXPOSE 80

# Lancer Apache en mode "foreground"
CMD ["apache2-foreground"]