FROM ruby:3.0.3-buster

RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && sed -i 's|security.debian.org|mirrors.tuna.tsinghua.edu.cn|g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y --fix-missing locales

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen && /usr/sbin/locale-gen
ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# rails -v x.x.x
RUN gem install -s https://gems.ruby-china.com/ rails


WORKDIR /app

COPY start.sh start.sh

RUN apt-get autoremove
RUN apt-get autoclean

CMD ["/app/start.sh"]