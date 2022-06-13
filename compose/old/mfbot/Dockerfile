FROM ubuntu:latest
LABEL maintainer="seintz (alias@anca.slmail.me)"

ENV TZ=Europe/Rome
RUN ln -sfn /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt-get update -y && \
    apt-get install -y \
    libsqlite3-dev \
    mono-runtime \
    screen \
    wget && \
    mkdir /mfbot

COPY entry.sh /

RUN chmod a+x /entry.sh

ENTRYPOINT ["/entry.sh"]
