FROM alpine:latest

COPY wait-for-status.sh /
RUN chmod +x /wait-for-status.sh

RUN apk add --update bash curl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/wait-for-status.sh"]
