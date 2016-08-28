FROM prophusion/prophusion-base
MAINTAINER Mike Baynton <mike@mbaynton.com>

RUN apt-get update

# install apache2
RUN apt-get install -y apache2 && apt-get clean

RUN a2dismod mpm_event
RUN a2enmod mpm_prefork

RUN git clone https://github.com/garamon/phpenv-apache-version /usr/local/phpenv/plugins/phpenv-apache-version

RUN rm /var/www/html/index.html
RUN ["/bin/bash", "-c", "echo '<p>This is the default homepage in the prophusion-apache docker image.</p><p>To run your application, mount it as a volume in the container at /var/www/html.</p><?php phpinfo(); ?>' > /var/www/html/index.php && chmod a+rw /var/www/html/index.php"]

COPY php5.load /etc/apache2/mods-available/php5.load
COPY php7.load /etc/apache2/mods-available/php7.load
COPY php.conf /etc/apache2/mods-available/php5.conf
COPY php.conf /etc/apache2/mods-available/php7.conf

EXPOSE 80

COPY prophusion-apache-entrypoint.sh /prophusion-apache-entrypoint.sh
ENTRYPOINT  ["/prophusion-apache-entrypoint.sh"]
