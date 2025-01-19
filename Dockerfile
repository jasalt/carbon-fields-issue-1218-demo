FROM docker.io/bitnami/wordpress:latest

USER 0

RUN install_packages vim rsync ripgrep autoconf build-essential
RUN pecl channel-update pecl.php.net
RUN pecl install xdebug

# RUN chmod -R 777 /opt/bitnami

# Disable (useless) persistence script that is broken after modifications
RUN sed -i '/restore_persisted_app/s/^/# HACK/' /opt/bitnami/scripts/libwordpress.sh

USER 1001
