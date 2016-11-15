FROM ubuntu:14.04
MAINTAINER mukki
#plugins
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install apache2 
RUN apt-get -y install git
RUN apt-get -y install tomcat7
RUN apt-get -y  install openjdk-7-jre
RUN apt-get  -y install openjdk-7-jdk
RUN apt-get -y install wget nano
WORKDIR /home
RUN wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.10.7-x64.bin
RUN chmod a+x atlassian-confluence-5.10.7-x64.bin
RUN wget https://github.com/mukendra/wiki/blob/master/varfile /home
RUN chmod 777 /home
RUN ./atlassian-confluence-5.10.7-x64.bin -q -varfile varfile
EXPOSE 80 8090
ENTRYPOINT /etc/init.d/confluence restart && sleep 3600
