FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs imagemagick
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

# Adiciona um script para ser executado na primeira vez que o container é iniciado.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Inicia o processo principal.
CMD ["rails", "server", "-b", "0.0.0.0"]
