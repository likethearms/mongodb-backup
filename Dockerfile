FROM phusion/baseimage:0.10.1

RUN apt-get update && apt-get -y install cron

COPY . /app

WORKDIR /app

RUN echo NAME_PRE_FIX='' >> env.sh
RUN echo NAME_POST_FIX='' >> env.sh
RUN echo AWS_SECRET_KEY='' >> env.sh
RUN echo AWS_ACCESS_KEY='' >> env.sh
RUN echo BUCKET='' >> env.sh
RUN echo BUCKET_PATH='mongo-backups' >> env.sh
RUN echo REQUEST_REGION='eu-central-1' >> env.sh
RUN echo LOG_PATH='/var/log/' >> env.sh

ENV CRON_TIME='0 1 * * *'

CMD /app/run.sh