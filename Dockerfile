# FROM amazon/aws-cli:2.7.4
FROM alpine:3.16.0

RUN apk add aws-cli
RUN apk add dumb-init

COPY ./docker-entrypoint .
RUN chmod +x ./docker-entrypoint

ENTRYPOINT [ "./docker-entrypoint" ]