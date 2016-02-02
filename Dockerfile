FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /snap_survey
WORKDIR /snap_survey
ADD Gemfile /snap_survey/Gemfile
ADD Gemfile.lock /snap_survey/Gemfile.lock
RUN bundle install
ADD . /snap_survey
