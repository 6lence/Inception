FROM debian:buster

EXPOSE 3306

RUN apt-get update && apt-get upgrade -y \
		&& apt-get install -y mariadb-server \
		&& mkdir -p /conf && chmod 755 /conf \
		&& apt-get install procps -y
COPY /conf/config.sh /conf/config.sh
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["/bin/bash", "/conf/config.sh"]
