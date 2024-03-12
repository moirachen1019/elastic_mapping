#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "${elastic_url}/${elasticPrefix}_chromecache?pretty" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 0,
    "analysis": {
      "char_filter": {
        "replace_special": {
          "type": "mapping",
          "mappings": [
						"\"=>_doublequotes_",
						"\\\\=>_backslash_",
						"/=>_slash_",
						"(=>_leftParentheses_",
						")=>_rightParentheses_",
						"[=>_leftBracket_",
						"]=>_rightBracket_",
						"*=>_asterisks_",
						"?=>_question_",
						"!=>_exclamation_",
						":=>_colon_",
						"+=>_plus_",
						"-=>_minus_",
						"~=>_tilde_",
						"^=>_caret_",
						"@=>_at_",
						"==>_equal_",
						">=>_moreThan_",
						"<=>_lessThan_",
						";=>_semicolon_",
						"{=>_rightBrace_",
						"}=>_leftBrace_",
						"&=>_and_",
						"|=>_pipe_",
						"%=>_percent_"
				]
        }
      },
      "analyzer": {
        "custom_analyzer": {
          "type": "custom",
          "tokenizer": "whitespace",
          "char_filter": ["replace_special"],
          "filter": "lowercase"
        }
      }
    }
  },
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "ip" },
                "agentName": { "type": "text", "analyzer": "custom_analyzer"},
                "id": { "type": "integer" },
                "url": { "type": "text", "analyzer": "custom_analyzer"},
                "web_site": { "type": "text", "analyzer": "custom_analyzer"},
                "frame": { "type": "text", "analyzer": "custom_analyzer"},
                "cache_control": { "type": "text", "analyzer": "custom_analyzer"},
                "content_encoding": { "type": "text", "analyzer": "custom_analyzer"},
                "content_length": { "type": "integer" },
                "content_type": { "type": "text", "analyzer": "custom_analyzer"},
                "date": { "type": "date" },
                "expires": { "type": "date" },
                "last_modified": { "type": "date" },
                "server": { "type": "text", "analyzer": "custom_analyzer"},
                "usage_counter": { "type": "integer" },
                "reuse_counter": { "type": "integer" },
                "item_main": { "type": "text", "analyzer": "custom_analyzer"},
                "date_main": { "type": "date" },
                "type_main": { "type": "text", "analyzer": "custom_analyzer"},
                "etc_main": { "type": "text", "analyzer": "custom_analyzer"},
                "task_id": { "type": "keyword" }
            }
        }
    }
}
'