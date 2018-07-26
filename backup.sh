# file=/home/henkka/dev/mongo-backup-cron/test.txt
# bucket=sjmk-work
# resource="/${bucket}/${file}"
# contentType="application/x-compressed-tar"
# dateValue=`date -u +%Y%m%dT%H%M%SZ`
# stringToSign="AWS4-HMAC-SHA256\n${dateValue}\n${dateValue}\ns3"
# echo $stringToSign
# s3Key=AKIAJJKZUYHXYX3G3VUA
# s3Secret=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
# #signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${s3Secret} -binary | base64`
# #signature=`echo -n "${stringToSign}" | openssl dgst -sha256 -mac HMAC -macopt "$s3Key" | sed 's/^.* //'`
# echo $signature
# # curl -X PUT -T "${file}" \
# #   -H "Host: ${bucket}.s3.amazonaws.com" \
# #   -H "Date: ${dateValue}" \
# #   -H "Content-Type: ${contentType}" \
# #   -H "Authorization: AWS ${s3Key}:${signature}" \
# #   https://${bucket}.s3.amazonaws.com/${file}
# # echo "Hello world" >> /var/log/backup_cron.log 2>&1
GZIP_FILENAME=$(date +"%Y-%m-%dT%H-%M-%SZ").tar.gz
mongodump
tar zcvf $GZIP_FILENAME dump
rm -rf dump
# rm -rf ./dump
# mongodump --host localhost --db remove --gzip --archive=dump_$(date +"%Y-%m-%dT%H:%M:%SZ").bson.gz
