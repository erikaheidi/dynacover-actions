FROM php:7.4-cli

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libonig-dev \
    libxml2-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Checkout Dynacover
RUN git clone -b 0.3.1 --depth 1 https://github.com/erikaheidi/dynacover.git && \
    cd dynacover && \
    composer install

ENTRYPOINT [ "php", "/dynacover/dynacover" ]
CMD ["cover", "update"]
