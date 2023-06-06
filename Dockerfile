FROM alpine:3.18

RUN apk add --no-cache bash

WORKDIR /app

COPY ./entrypoint.sh ./

ENTRYPOINT ["./entrypoint.sh"]