FROM debian:buster

EXPOSE	443

RUN apt update -y
RUN apt install nginx -y
RUN apt install vim -y
RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y
RUN echo "first"
RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt -sha256 -subj "/CN=mescobar.42.fr"
RUN echo "second"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
