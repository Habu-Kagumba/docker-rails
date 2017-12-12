FROM ruby:2.4-alpine3.6
MAINTAINER Herbert Kagumba <habukagumba@gmail.com>

ENV RAILS_VERSION="5.1.4"

RUN \
    apk --update --upgrade add \
    curl-dev build-base openssh \
    zlib-dev libxml2-dev libxslt-dev \
    tzdata yaml-dev postgresql-dev imagemagick-dev \
    git nodejs nodejs-npm

RUN \
    gem install -N nokogiri \
 && gem install -N rails --version "$RAILS_VERSION" \
 && echo 'gem: --no-document' >> ~/.gemrc \
 && cp ~/.gemrc /etc/gemrc \
 && chmod uog+r /etc/gemrc \
 # cleanup and settings
 && bundle config --global build.nokogiri  "--use-system-libraries" \
 && bundle config --global build.nokogumbo "--use-system-libraries" \
 && find / -type f -iname \*.apk-new -delete \
 && rm -rf /var/cache/apk/* \
 && rm -rf /usr/lib/lib/ruby/gems/*/cache/* \
 && rm -rf ~/.gem
