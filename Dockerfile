FROM ruby:3.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /store_manager
COPY Gemfile /store_manager/Gemfile
COPY Gemfile.lock /store_manager/Gemfile.lock
RUN bundle install
COPY . /store_manager


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]