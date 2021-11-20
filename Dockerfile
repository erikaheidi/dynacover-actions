FROM erikaheidi/phpgd-base:7.4

# Checkout Dynacover
RUN git clone -b 0.4 --depth 1 https://github.com/erikaheidi/dynacover.git && \
    cd dynacover && \
    composer install

ENTRYPOINT [ "php", "/dynacover/dynacover" ]
CMD ["cover", "update"]
