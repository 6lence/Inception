FROM debian:buster

RUN	apt-get update -y &&\
	apt-get upgrade -y &&\
	apt-get install wget -y &&\
	apt-get install -y php7.3 php-fpm php-mysql mariadb-client &&\
	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www &&\
	cd /var/www &&\
	tar -xzf wordpress-6.0-fr_FR.tar.gz &&\
	rm wordpress-6.0-fr_FR.tar.gz &&\
	chown -R root:root /var/www/wordpress &&\
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod 755 wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp &&\
	mkdir -p /run/php/


EXPOSE 9000

RUN mkdir -p /conf && chmod 755 /conf

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/auto-config.sh  ./conf/auto-config.sh
COPY ./conf/index.html /conf/index.html
COPY ./conf/wp-config.php /var/www/wordpress/

RUN chmod +x /conf/auto-config.sh

ENTRYPOINT ["/bin/bash", "/conf/auto-config.sh"]
