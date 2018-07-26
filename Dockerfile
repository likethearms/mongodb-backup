FROM phusion/baseimage:0.10.1

RUN apt-get update && apt-get -y install cron

COPY . /app

ENV NAME_PRE_FIX=''
ENV NAME_POST_FIX=''
ENV AWS_SECRET_KEY=''
ENV AWS_ACCESS_KEY=''

CMD /app/run.sh