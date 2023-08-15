#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_eventsecurity?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "eventrecordid": { "type": "integer" },
                "providername": { "type": "text" },
                "providerguid": { "type": "keyword" },
                "eventid": { "type": "long" },
                "version": { "type": "integer" },
                "level": { "type": "keyword" },
                "keywords": { "type": "text" },
                "task": { "type": "integer" },
                "opcode": { "type": "integer" },
                "createdsystemtime": { "type": "date" },
                "correlationactivityid": { "type": "keyword" },
                "correlationrelatedactivityid": { "type": "keyword" },
                "executionprocessid": { "type": "integer" },
                "executionthreadid": { "type": "integer" },
                "channel": { "type": "keyword" },
                "computer": { "type": "keyword" },
                "securityuserid": { "type": "keyword" },
                "evtrenderdata": { "type": "text" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'