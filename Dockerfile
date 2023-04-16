FROM ruby:2.7

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN gem install bundler:1.17.3

COPY . .

EXPOSE 4001
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "4001"]
