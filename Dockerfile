FROM debian:stretch-slim
MAINTAINER Christos Pitsikalis

# Install Generic packages
RUN \
	apt-get update && \
	apt-get install -my apt-utils wget gnupg && \
	echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/java-8-debian.list && \
	echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/java-8-debian.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
	apt-get update && \
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
	apt-get install -y java-common && \
	apt-get install -y oracle-java8-installer && \
	apt-get install -y oracle-java8-set-default && \
	apt-get install -y git && \
	apt-get install -y maven

# Install Java specific packages
RUN \
	cd /usr/lib/jvm && ls -l

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Build Java app
RUN \
	cd && \
	git clone https://github.com/ChristosPitsis/PerfectMatch.git && \
	cd PerfectMatch/ && \
	mvn clean package

EXPOSE 8080

# Install NodeJS specific packages
RUN \
	curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
	apt-get install -y nodejs npm && \
	apt-get install -y build-essential && \
	update-alternatives --install /usr/bin/node node /usr/bin/nodejs 8 && \
	npm install --save fs && \
	npm install --save util && \
	npm install --save libxmljs && \
	npm install --save jsonschema && \
	npm install --save express && \
	npm install --save xmlbuilder && \
	npm install --save body-parser && \
	npm install --save express-xml-bodyparser && \
	npm install --save xmlhttprequest && \
	npm install --save xml2json

EXPOSE 8081

# Cleanup Cache
RUN \
	apt-get autoremove -y && \
	apt-get autoclean && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/*

ADD start_apps.sh ~/

RUN \
	cd ~/ && \
	chmod +x start_apps.sh

CMD \
	./start_apps.sh
