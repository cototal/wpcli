FROM wordpress:5

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY custom-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["custom-entrypoint.sh"]
CMD ["apache2-foreground"]
