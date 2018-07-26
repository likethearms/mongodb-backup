export CRON_TIME="* * * * *"
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