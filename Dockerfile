FROM docker:25

RUN printf '%s\n' \
  'https://dl-cdn.alpinelinux.org/alpine/v3.19/main' \
  'https://dl-cdn.alpinelinux.org/alpine/v3.19/community' \
  > /etc/apk/repositories \
  && apk add --no-cache aws-cli=2.15.14-r0

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
