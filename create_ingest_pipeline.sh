curl -X PUT "localhost:9200/_ingest/pipeline/attachment" -H 'Content-Type: application/json' -d @- <<EOF
{
  "description" : "Extract attachment information from arrays",
  "processors" : [
    {
      "foreach": {
        "field": "attachments",
        "processor": {
          "attachment": {
            "target_field": "_ingest._value.attachment",
            "field": "_ingest._value.data"
          }
        }
      }
    }
  ]
}
EOF
