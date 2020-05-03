FROM kouinkouin/debian-base:10

ENV EMAIL=

RUN apt-get update \
  && apt-get install -y certbot \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ADD files/etc /etc
ADD files/run.sh /sbin/run
RUN chmod +x /sbin/run

ENTRYPOINT ["run"]

