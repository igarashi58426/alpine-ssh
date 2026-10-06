FROM alpine:latest

RUN apk update \
    && apk add --no-cache openssh-client \
    && rm -f /var/cache/apk/*

CMD ["/bin/sh"]