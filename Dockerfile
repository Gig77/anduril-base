FROM debian:7.8

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/httpredir.debian.org/ftp.debian.org/' /etc/apt/sources.list

# essentials

RUN apt-get update && apt-get install -y \
	locales \
	wget \
	apt-utils \
	sudo

# locales

RUN localedef -c -i en_US -f UTF-8 en_US.UTF-8
ENV LANG en_US.UTF-8

# use latest R version 3.2

RUN echo 'deb http://cran.at.r-project.org/bin/linux/debian wheezy-cran3/' >> /etc/apt/sources.list && \
    gpg --keyserver pgp.mit.edu --recv-keys 06F90DE5381BA480 && \
    gpg --armor --export 06F90DE5381BA480 | apt-key add -

# packages required by Anduril

RUN echo 'deb http://csbl.fimm.fi/linux/ binary/' > /etc/apt/sources.list.d/anduril.list  && \
    wget http://csbl.fimm.fi/linux/anduril_pub.gpg -O - | apt-key add -
RUN apt-get update && apt-get install -y anduril-local-installer

# Anduril bundles

#RUN anduril-source-install Sequencing Anima GROK CookBook
RUN anduril-source-install Sequencing
RUN anduril-source-update
RUN echo y | anduril-local-enable
RUN rm /etc/apt/sources.list.d/cran-r.list

# environment variables

ENV ANDURIL_HOME /usr/local/share/anduril
ENV ANDURIL_BUNDLES /usr/local/share/anduril-bundles
ENV SCALA_HOME /usr/local/share/scala
ENV PATH $SCALA_HOME/bin:$PATH:$ANDURIL_HOME/bin:$ANDURIL_HOME/utils

# Anduril user

RUN export uid=10001 gid=10000 && \
    mkdir -p "/home/anduril" && \
    echo "anduril:x:${uid}:${gid}:anduril,,,:/home/anduril:/bin/bash" >> /etc/passwd && \
    echo "anduril:x:${gid}:" >> /etc/group && \
    echo "docker:x:997:anduril" >> /etc/group && \
    echo "STANNANET\domänen-benutzer:x:${gid}:anduril" >> /etc/group && \
    echo "anduril ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/anduril" && \
    chmod 0440 "/etc/sudoers.d/anduril" && \
    chown ${uid}:${gid} -R "/home/anduril"
ENV HOME /home/anduril

# useful utils

RUN apt-get update && apt-get install -y \
	less

# clean up

RUN apt-get clean

