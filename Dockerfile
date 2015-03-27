FROM debian:jessie
MAINTAINER Nobuyuki Aoki "aokinobu@gmail.com"

RUN apt-get update ##
RUN apt-get -y install libapache2-mod-php5

ADD run.sh /run.sh
RUN chmod a+x run.sh

ADD 010-ts.glytoucan.conf /etc/apache2/sites-available/010-ts.glytoucan.conf
ADD apache2.conf /etc/apache2/apache2.conf

RUN a2ensite 010-ts.glytoucan.conf
RUN a2enmod proxy
RUN a2enmod proxy_http

EXPOSE 80 443

CMD ["/run.sh"]
