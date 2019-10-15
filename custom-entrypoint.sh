#!/bin/bash

# Use CUSTOM_HTA for htaccess file if variable is not empty
if [[ ! -z "$CUSTOM_HTA" ]]
then
    echo "$CUSTOM_HTA" > /var/www/html/.htaccess
fi

# Proceed to base image entrypoint
docker-entrypoint.sh "$@"
