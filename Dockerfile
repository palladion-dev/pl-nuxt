FROM node:13.10.1-alpine3.11

LABEL maintainer="akidsuki <akidsuki@palladion.jp>"

RUN apk update \
  && apk add --no-cache --update alpine-sdk build-base git g++ python make yarn \
  && yarn install --ignore-engines \
  && yarn cache clean \
  && yarn global add create-nuxt-app \
  && apk del alpine-sdk \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache clear --force \
  && yarn cache clean \
  && mkdir /usr/my_projects

  WORKDIR /usr/my_projects
