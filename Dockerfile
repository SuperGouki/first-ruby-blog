FROM ruby:2.7

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler:1.17.3
RUN bundle install


COPY . .
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "4001"]
EXPOSE 4001

