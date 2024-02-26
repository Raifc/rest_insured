FROM ruby:3.2.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

RUN rails db:drop RAILS_ENV=development && \
    rails db:create RAILS_ENV=development && \
    rails db:migrate RAILS_ENV=development

CMD ["rails", "server", "-b", "0.0.0.0"]
