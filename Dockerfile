FROM wordpress:5

ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY custom-entrypoint.sh /usr/local/bin/
# WordFence snippet. shouldn't impact sites that don't have WordFence installed
COPY wordfence-waf.php /var/www/html/wordfence-waf.php

ENTRYPOINT ["custom-entrypoint.sh"]
CMD ["apache2-foreground"]
