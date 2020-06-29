FROM ruby:alpine

COPY . /usr/src/app
VOLUME /usr/src/app
EXPOSE 4567

WORKDIR /usr/src/app

RUN apk add --update nodejs build-base
RUN bundle install

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
