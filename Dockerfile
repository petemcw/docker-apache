FROM linuxserver/baseimage.apache
MAINTAINER Pete McWilliams <petemcw@gmail.com>

ENV APTLIST="inotify-tools wget ca-certificates sslmate libapache2-mod-proxy-html php5-mcrypt"

RUN curl -s -o /etc/apt/sources.list.d/sslmate.list https://sslmate.com/apt/ubuntu1404/sslmate.list && \
    curl -s -o /etc/apt/trusted.gpg.d/sslmate.gpg https://sslmate.com/apt/ubuntu1404/sslmate.gpg

RUN apt-get update && \
  apt-get install $APTLIST -qy && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*

# add custom scripts & files
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/service/*/finish /etc/my_init.d/*.sh

# update Apache configuration
RUN a2enmod proxy proxy_http proxy_ajp rewrite deflate substitute headers \
    proxy_balancer proxy_connect proxy_html xml2enc

# ports & volumes
EXPOSE 80 443
VOLUME /config
