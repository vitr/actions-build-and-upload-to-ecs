FROM docker:24.0.4

RUN apk add --update --no-cache curl py-pip

RUN apk update \
  && apk upgrade \
  && rm -rf /var/cache/apk/* \
  && pip install awscli \
  && apk --purge -v del py-pip

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
