#Example ....

ENDPOINT='s3.'$AWS_REGION'.amazonaws.com'
NEW_BUCKET=uat-k8-es-backup
curl -X PUT "localhost:9200/_snapshot/uat_s3_repository?pretty" -H 'Content-Type: application/json' -d @- <<EOF
{
  "type": "s3",
  "settings": {
    "bucket": "$NEW_BUCKET",
    "region": "$AWS_REGION",
    "endpoint": "$ENDPOINT",
    "compress": true
  }
}
EOF
curl -X POST -H 'Content-Type: application/json' "localhost:9200/_snapshot/uat_s3_repository/snapshot_1578403878/_restore" 