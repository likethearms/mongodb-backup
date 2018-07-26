if [ -z ${NAME_PRE_FIX+x} ]; then echo NAME_PRE_FIX='' >> env.sh; else echo NAME_PRE_FIX=$NAME_PRE_FIX >> env.sh; fi
if [ -z ${NAME_POST_FIX+x} ]; then echo NAME_POST_FIX='' >> env.sh; else echo NAME_POST_FIX=$NAME_POST_FIX >> env.sh; fi
if [ -z ${AWS_SECRET_KEY+x} ]; then echo AWS_SECRET_KEY='' >> env.sh; else echo AWS_SECRET_KEY=$AWS_SECRET_KEY >> env.sh; fi
if [ -z ${AWS_ACCESS_KEY+x} ]; then echo AWS_ACCESS_KEY='' >> env.sh; else echo AWS_ACCESS_KEY=$AWS_ACCESS_KEY >> env.sh; fi
if [ -z ${BUCKET+x} ]; then echo BUCKET='' >> env.sh; else echo BUCKET=$BUCKET >> env.sh; fi
if [ -z ${BUCKET_PATH+x} ]; then echo BUCKET_PATH='mongo-backups' >> env.sh; else echo BUCKET_PATH=$BUCKET_PATH >> env.sh; fi
if [ -z ${REQUEST_REGION+x} ]; then echo REQUEST_REGION='eu-central-1' >> env.sh; else echo REQUEST_REGION=$REQUEST_REGION >> env.sh; fi

if [ -z ${MONGO_PORT+x} ]; then echo MONGO_PORT='--port=27017' >> env.sh; else echo MONGO_PORT="--port=$MONGO_PORT" >> env.sh; fi
if [ -z ${MONGO_HOST+x} ]; then echo MONGO_HOST='--host=127.0.0.1' >> env.sh; else echo MONGO_HOST="--host=$MONGO_HOST" >> env.sh; fi
if [ -z ${MONGO_DB+x} ]; then echo MONGO_DB='' >> env.sh; else echo MONGO_DB="--db=$MONGO_DB" >> env.sh; fi
if [ -z ${MONGO_USERNAME+x} ]; then echo MONGO_USERNAME='' >> env.sh; else echo MONGO_USERNAME="--username="$MONGO_USERNAME >> env.sh; fi
if [ -z ${MONGO_PASSWORD+x} ]; then echo MONGO_PASSWORD='' >> env.sh; else echo MONGO_PASSWORD="--password="$MONGO_PASSWORD >> env.sh; fi

if [ -z ${CRON_TIME+x} ]; then CRON_TIME='0 1 * * *' >> env.sh; fi

cat /app/env.sh >> /var/log/backup_cron.log

echo "${CRON_TIME} /app/backup.sh" >> /app/crontab
# # Add crontab file in the cron directory
cp /app/crontab /etc/cron.d/mongo-backup-cron

# # Give execution rights on the cron job
chmod 0644 /etc/cron.d/mongo-backup-cron

# # Apply cron job
crontab /etc/cron.d/mongo-backup-cron

# # Create the log file to be able to run tail
touch /var/log/backup_cron.log

cat /etc/cron.d/mongo-backup-cron
# # Run the command on container startup
cron && tail -f /var/log/backup_cron.log