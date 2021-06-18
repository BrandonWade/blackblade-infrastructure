#!/bin/bash

echo "db backup"
TSTAMP=$(date +"%Y%d%m")

mysqldump -uroot -proot -hblackblade-db blackblade | gzip > "$TSTAMP.sql.gz"

# To unzip a backup
# gzip -dk "$TSTAMP.sql.gz"
