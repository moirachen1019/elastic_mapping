#! /usr/bin/env bash

curl -X PUT "http://ela.ed.qa:9200/ed_dnsinfo?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "timetolive": { "type": "integer" },
                "pscomputername": { "type": "keyword" },
                "caption": { "type": "text" },
                "description": { "type": "text" },
                "elementname": { "type": "keyword" },
                "instanceid": { "type": "integer" },
                "data": { "type": "text" },
                "datalength": { "type": "integer" },
                "entry": { "type": "text" },
                "name": { "type": "text" },
                "section": { "type": "integer" },
                "status": { "type": "integer" },
                "type": { "type": "integer" }
            }
        }
    }
}
'