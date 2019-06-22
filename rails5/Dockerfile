FROM ruby:2.6.3-alpine
MAINTAINER Herbert Kagumba <habukagumba@gmail.com>

ENV RAILS_VERSION="5.2.3"

RUN \
    apk --update --upgrade --no-cache add \
    build-base tzdata postgresql-dev imagemagick \
    git nodejs nodejs-npm

RUN gem install -N rails --version "$RAILS_VERSION"
