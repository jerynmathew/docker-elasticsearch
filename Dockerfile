FROM ubuntu:trusty
MAINTAINER Jeryn Mathew <jerynmathew@gmail.com>

# Deps: Java, Curl, Supervisor
RUN apt-get update && \
    apt-get install -y curl wget openjdk-7-jre-headless supervisor apache2-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Elasticsearch
RUN cd /tmp && \
    wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.4.tar.gz && \
    tar -xvzf ./elasticsearch-1.3.4.tar.gz && \
    mv ./elasticsearch-1.3.4 /opt/elasticsearch && \
    rm ./elasticsearch-1.3.4.tar.gz && \
    mkdir /data

# Copy conf across
ADD conf/es.conf /etc/supervisor/conf.d/es.conf
ADD conf/elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
ADD run.sh /run.sh
RUN chmod +x /*.sh

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# ES Plugins
RUN /opt/elasticsearch/bin/plugin -i elasticsearch/marvel/latest && \
    /opt/elasticsearch/bin/plugin -i lukas-vlcek/bigdesk/2.5.0 && \
    /opt/elasticsearch/bin/plugin -i royrusso/elasticsearch-HQ

# Define default command.
CMD ["/run.sh"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
