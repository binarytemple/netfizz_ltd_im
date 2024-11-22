FROM alpine:latest

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apk add ruby-bundler ruby-dev make gcc dev86 build-base zlib-dev ruby-nokogiri ruby-json 

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock jekyll-mergefailure-theme.gemspec ./

#RUN apk add libxml2 libxslt musl ruby ruby-libs ruby-mini_portile2

RUN bundle install

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "help"]
