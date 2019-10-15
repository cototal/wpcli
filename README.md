This container includes the WP CLI for some management tools.

It also allows for a custom .htaccess configuration. To do this using environment variables, you can first create an `.htaccess` file:

```
<Files xmlrpc.php>
    order deny,allow
    deny from all
</Files>
```

Then get the content of that file and save it as an environment variable.

```
export HTA1=`cat .htaccess`
```

If using docker compose, you can access this environment variable and set it as `CUSTOM_HTA`.

```yaml
environment:
    - "CUSTOM_HTA=${HTA1}"
```

If using the Docker command, just set it with the `-e` option. Remember to put double quotes around the local environment variable.

```
docker run -e CUSTOM_HTA="$HTA1"
```
