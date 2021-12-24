FROM centos:latest

RUN yum update -y && \
    yum -y install httpd

COPY index.html /var/www/html/

ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
