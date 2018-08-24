FROM ubuntu:latest
MAINTAINER karthikeyan
RUN apt-get update && apt-get install apache2 -y
WORKDIR /var/www/html
RUN mkdir appgoogle appyahoo appamazon
RUN echo "welcome to appgoogle-version3" > appgoogle/index.html
RUN echo "welcome to appyahoo-version3" > appyahoo/index.html
RUN echo "welcome to appamazon-version3" > appamazon/index.html
COPY my-httpd.conf /etc/apache2/sites-available/app.conf
RUN echo "Listen 8080" >> /etc/apache2/ports.conf
RUN echo "Listen 8081" >> /etc/apache2/ports.conf
RUN a2dissite 000-default
RUN a2ensite app.conf
EXPOSE 80 8080 8081
CMD ["/usr/sbin/apachectl","-DFOREGROUND"]
