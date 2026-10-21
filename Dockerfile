FROM ubuntu:24.04

RUN apt-get update && apt-get install -y iputils-ping procps lsb-release hostname


COPY app/ /app/

RUN chmod +x /app/diagnostic.sh

ENTRYPOINT ["/app/diagnostic.sh"]

