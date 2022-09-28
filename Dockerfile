FROM erikaheidi/minicli:php81

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Checkout Dynacover
RUN git clone -b 0.4 --depth 1 https://github.com/erikaheidi/dynacover.git && \
    cd dynacover && \
    composer install --no-progress --no-dev --prefer-dist

ENTRYPOINT [ "php81", "/dynacover/dynacover" ]
CMD ["cover", "update"]
