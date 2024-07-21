FROM ubuntu:latest

ARG LANG="en_US.UTF-8"
ARG LC_ALL="en_US.UTF-8"
ENV TZ=Europe/London
ENV DEBIAN_FRONTEND=noninteractive

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app

COPY setup.sh /app/setup.sh

RUN chmod +x /app/setup.sh

RUN apt-get update && \
    apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

