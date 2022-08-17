FROM alpine:latest
RUN set -xe \
 && apk add --no-cache \
        curl \
        bash \
        bash-completion \
        tini 
RUN set -xe \
 && echo 'hosts: files dns' > /etc/nsswitch.conf


