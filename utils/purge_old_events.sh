curl -X POST "localhost:9201/nifi/_delete_by_query?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "range" : {
      "event_time_iso_utc": {
        "lte": "now-30d"
      }
    }
  }
}
' &&
curl -X GET "localhost:9201/_refresh?pretty" &&
curl -X POST "localhost:9201/nifi/_forcemerge?only_expunge_deletes=true"
