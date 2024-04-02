RUN	apt-get update -y &&\
	apt-get upgrade -y &&\
	apt-get install wget -y &&\
	apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client &&\
	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www &&\
	cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz &&\
	chown -R root:root /var/www/wordpress &&\

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d


