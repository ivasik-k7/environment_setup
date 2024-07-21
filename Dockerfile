FROM ubuntu:latest

WORKDIR /app

COPY setup.sh /app/setup.sh

RUN chmod +x /app/setup.sh

RUN apt-get update && \
    apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

