FROM phusion/baseimage:0.10.1

RUN apt-get update && apt-get -y install cron

COPY . /app

WORKDIR /app

CMD /app/run.sh