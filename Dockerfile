FROM python:3.7-alpine

LABEL name="trufflehog-actions-scan"
LABEL version="1.0.1"
LABEL repository="https://github.com/nasa-gibs/trufflehog-actions-scan"
LABEL homepage="https://github.com/nasa-gibs/trufflehog-actions-scan"
LABEL maintainer="Ed Plato - NASA GIBS"

LABEL "com.github.actions.name"="Trufflehog Actions Scan"
LABEL "com.github.actions.description"="Scan repository for secrets with basic trufflehog defaults in place for easy setup."
LABEL "com.github.actions.icon"="shield"
LABEL "com.github.actions.color"="yellow"

RUN pip install gitdb2==3.0.0 truffleHog
RUN apk --update add git less openssh && \
  rm -rf /var/lib/apt/lists/* && \
  rm /var/cache/apk/*

ADD entrypoint.sh  /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
