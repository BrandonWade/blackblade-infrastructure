#!/bin/bash

echo "backing up database..."
START=$(date +%s)
TODAY=$(date +"%Y%m%d")

# Dump the db and compress the resulting file
mysqldump -u${DB_USERNAME} -p${DB_PASSWORD} -h${DB_HOST} ${DB_DATABASE} | gzip > "${TODAY}.sql.gz"

# Upload the file to the Digital Ocean space
aws s3 mv "${TODAY}.sql.gz" s3://${DO_SPACE_NAME}/ --endpoint=https://${DO_SPACE_ENDPOINT}

END=$(date +%s)
RUNTIME=$(date -d@$((END - START)) -u +%Hh%Mm%Ss)
echo "backup successfully completed in ${RUNTIME}"
