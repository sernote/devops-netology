Вопрос 1. \
Dockerfile:
````
FROM centos:7
RUN yum upgrade -y
RUN yum install perl-Digest-SHA -y
RUN yum install wget -y
RUN adduser elasticsearch
USER elasticsearch
WORKDIR /home/elasticsearch
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.0-linux-x86_64.tar.gz
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.15.0-linux-x86_64.tar.gz.sha512

RUN shasum -a 512 -c elasticsearch-7.15.0-linux-x86_64.tar.gz.sha512
RUN tar -xzf elasticsearch-7.15.0-linux-x86_64.tar.gz

WORKDIR elasticsearch-7.15.0/
ENTRYPOINT ["./bin/elasticsearch"]
````
