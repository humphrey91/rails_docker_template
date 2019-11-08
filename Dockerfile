FROM ruby:2.6.5-alpine3.10

RUN apk update \
  && apk add -Uuv \
    alpine-sdk \ 
    bash \
    git \
    less \
    nodejs \
    yarn \ 
    tzdata \
  && rm -rf /var/cache/apk/*

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]