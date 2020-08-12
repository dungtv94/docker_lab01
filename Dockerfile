FROM ubuntu:18.04

# Author
LABEL author.name="DungTV" \
    author.email="dungtv@ghtk.vn"

# Configure the main working directory
ENV APP_PATH /venv
WORKDIR $APP_PATH

# Set the timezone.
ENV TZ=Asia/Ho_Chi_Minh
RUN set -x \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

RUN set -x \
    && apt-get update \
    && apt-get install -y nginx vim

RUN set -x \
    && echo "mysql-server mysql-server/root_password password root" | debconf-set-selections \
    && echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections \
    && apt-get install -y mysql-server

COPY start.sh /venv

RUN set -x \
    && chmod a+x /venv/*

ENTRYPOINT ["/venv/start.sh"]

EXPOSE 80