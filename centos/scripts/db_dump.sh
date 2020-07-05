#!/usr/bin/bash

DATE=$(date +%H-%M-%S)
BACKUP_PSQL=$DATE-postgres-jenkins
DB_PASSWD=$1
DB_HOST=$2
DB_PORT=$3
DB_USER=$4
DB_NAME=$5
AWS_SECRET_KEY_KEY=$6
S3_BUCKET=$7

PGPASSWORD=$DB_PASSWD pg_dump -U $DB_USER -h $DB_HOST -p $DB_PORT $DB_NAME > /tmp/pg_data/$BACKUP_PSQL && \
export AWS_ACCESS_KEY_ID=AKIA5ZKTCPL2DAEVRSQA && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY && \
echo "Uploading to S3" && \
aws s3 cp /tmp/pg_data/$DATE-postgres-jenkins s3://$S3_BUCKET/$BACKUP_PSQL
