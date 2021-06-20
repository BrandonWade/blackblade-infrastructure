#!/bin/bash

echo "db backup"
TODAY=$(date +"%Y%m%d")

# Dump the db and compress the resulting file
mysqldump -uroot -proot -hblackblade-db blackblade | gzip > "$TODAY.sql.gz"

# To unzip a backup
# gzip -dk "$TODAY.sql.gz"
