FROM alpine:3.18

RUN apk add --no-cache bash curl

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

WORKDIR /app

COPY ./entrypoint.sh ./

ENTRYPOINT ["./entrypoint.sh"]