FROM ruby:2.4.1

ENV HOME_DIR /app

RUN mkdir -p $HOME_DIR
WORKDIR $HOME_DIR

COPY Gemfile* $HOME_DIR/

RUN bundle install --deployment

COPY . $HOME_DIR/

RUN mkdir -p /web_tmp

CMD rackup -o 0.0.0.0
