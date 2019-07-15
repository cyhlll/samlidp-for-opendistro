FROM php:7.1-apache
MAINTAINER Yuanhai Chen <yuanhaichen1210@gmail.com>


RUN apt-get update && \
    apt-get -y install apt-transport-https git curl vim --no-install-recommends && \
    rm -r /var/lib/apt/lists/*

ARG SIMPLESAMLPHP_V=1.17.2
RUN curl -s -L -o /tmp/simplesamlphp.tar.gz https://github.com/simplesamlphp/simplesamlphp/releases/download/v$SIMPLESAMLPHP_V/simplesamlphp-$SIMPLESAMLPHP_V.tar.gz && \
    tar xzf /tmp/simplesamlphp.tar.gz -C /tmp && \
    rm -f /tmp/simplesamlphp.tar.gz  && \
    mv /tmp/simplesamlphp-* /var/www/simplesamlphp && \
    touch /var/www/simplesamlphp/modules/exampleauth/enable

# Apache
COPY config/apache/ports.conf /etc/apache2
COPY config/apache/simplesamlphp.conf /etc/apache2/sites-available
COPY config/apache/cert.crt /etc/ssl/cert/cert.crt
COPY config/apache/private.key /etc/ssl/private/private.key
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    a2enmod ssl && \
    a2dissite 000-default.conf default-ssl.conf && \
    a2ensite simplesamlphp.conf

COPY config/OpenDistroChange/loginuserpass.php /var/www/simplesamlphp/modules/core/templates/loginuserpass.php
COPY config/OpenDistroChange/open_distro_for_elasticsearch_logo_h.svg /var/www/simplesamlphp/www/resources/


COPY config/DefaultSetting/config.php /var/www/simplesamlphp/config/
COPY config/DefaultSetting/authsources.php /var/www/simplesamlphp/config/
COPY config/DefaultSetting/saml20-idp-hosted.php /var/www/simplesamlphp/metadata/
COPY config/DefaultSetting/saml20-sp-remote.php /var/www/simplesamlphp/metadata/
COPY config/DefaultSetting/docker-entrypoint.sh /var/www/simplesamlphp/

# Set work dir
WORKDIR /var/www/simplesamlphp

# General setup
EXPOSE 8080 8443

ENTRYPOINT ["/var/www/simplesamlphp/docker-entrypoint.sh"]
