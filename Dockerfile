FROM minicli/php81-dev:latest AS builder
WORKDIR /home/minicli
RUN git clone -b 1.0.1 --depth 1 https://github.com/erikaheidi/dynacover.git && \
    cd dynacover && \
    composer install --no-progress --no-dev --prefer-dist

FROM minicli/php81:latest
COPY --from=builder /home/minicli/dynacover /home/minicli

ENTRYPOINT [ "php81", "/home/minicli/dynacover" ]
CMD ["cover", "update"]
