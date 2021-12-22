FROM ruby:3.0.3-buster

RUN apt-get update && apt-get install -y --fix-missing locales

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen && /usr/sbin/locale-gen
ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

WORKDIR /app
# COPY Gemfile /app
# COPY Gemfile.lock /app

RUN gem sources --remove https://rubygems.org/
RUN gem sources -a https://gems.ruby-china.com/
RUN bundle install

CMD ["/app/start.sh"]