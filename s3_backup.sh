ENDPOINT='s3.'$AWS_REGION'.amazonaws.com'
curl -X PUT "localhost:9200/_snapshot/my_s3_repository?pretty" -H 'Content-Type: application/json' -d @- <<EOF
{
  "type": "s3",
  "settings": {
    "bucket": "$ES_BACKUP_BUCKET",
    "region": "$AWS_REGION",
    "endpoint": "$ENDPOINT",
    "compress": true
  }
}
EOF
curl -X PUT "localhost:9200/_snapshot/my_s3_repository/snapshot_$(date +%s)?wait_for_completion=true"

# curl -X PUT "https://vpc-es-netin-j5dzjowt4h64laxezp652amhaa.us-west-2.es.amazonaws.com/_snapshot/my_s3_repository/snapshot_es_netin_3feb_30k?wait_for_completion=true"