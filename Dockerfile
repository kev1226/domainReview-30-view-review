FROM ruby:3.2

WORKDIR /app

COPY . .

RUN gem install bundler && bundle install

EXPOSE 3080

CMD ["ruby", "main.rb", "-p", "3080"]
