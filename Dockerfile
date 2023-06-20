# Container image that runs your code
FROM alpine:3.18

RUN apk add --no-cache packer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
