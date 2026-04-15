FROM docker:25.0.5-cli

RUN apk add --no-cache aws-cli

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
