# petemcw/docker-apache

This is an Apache web server container with reverse proxy services enabled. Reverse proxy gives the ability to visit http://www.domain.com/service and serve http://www.domain.com:8351. You can also enable HTTPS.

![](https://raw.githubusercontent.com/petemcw/docker-templates/master/petemcw/img/apache-banner.png)

## Usage

```
docker create --name=apache -v <path to data>:/config \
    -e PGID=<gid> \
    -e PUID=<uid> \
    petemcw/apache
```

**Parameters**

* `-v /config`
* `-e PGID` for GroupID - *optional*
* `-e PUID` for UserID - *optional*
* The ports `80` and `443` are exposed

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it apache /bin/bash`.

## Setting up the application

* Config files are located in `/config/apache`
* Place web files in `/config/www`
* Place keys in `/config/keys`

## Updates

* Upgrade to the latest version simply `docker restart apache`.
* To monitor the logs of the container in real-time `docker logs -f apache`.

## Credits

This Docker container is based on the great work from the team at [LinuxServer.io](https://www.linuxserver.io/).
