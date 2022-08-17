FROM alpine:latest
RUN set -xe \
 && apk add --no-cache \
        curl \
        bash \
        bash-completion \
        tini 
RUN set -xe \
 && echo 'hosts: files dns' > /etc/nsswitch.conf

LABEL \
  org.opencontainers.image.title="base/alpine" \
  org.opencontainers.image.base.name="$BASE_IMAGE" \
  org.opencontainers.image.description="A minimal docker base image based on Alpine Linux"
