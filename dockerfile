FROM ruby:3.4

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile

RUN bundle install
