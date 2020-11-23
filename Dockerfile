FROM debian:latest

RUN apt-get update && apt-get install -y gnupg2 && apt-get install -y procps
RUN apt install -y openjdk-11-jre

#Should probably check java version
RUN apt install -y wget apt-transport-https curl
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list

RUN apt update
RUN apt install -y elasticsearch-oss

RUN service elasticsearch start 

RUN apt install -y logstash-oss
# CONFIGURE AND RUN LOGSTASH


RUN apt install -y kibana-oss
# CONFIGURE KIBANA

RUN service kibana start

## FIREBEAT ..... Etc

