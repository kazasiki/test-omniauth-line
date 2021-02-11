FROM ruby:2.7

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile

RUN bundle install
