FROM ruby:2.6.4-alpine
MAINTAINER Herbert Kagumba <habukagumba@gmail.com>

ENV RAILS_VERSION="6.0.0"

RUN \
    apk --update --upgrade --no-cache add \
    build-base tzdata postgresql-dev imagemagick \
    git nodejs nodejs-npm

RUN gem install -N rails --version "$RAILS_VERSION"
