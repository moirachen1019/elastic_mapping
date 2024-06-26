#! /usr/bin/env bash
elastic_url=$1

curl -X PUT "${elastic_url}/ed_process?pretty" -H 'Content-Type: application/json' -d'
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
                "pid": { "type": "integer" },
                "process_name": { "type": "text", "analyzer": "custom_analyzer"},
                "parent_pid": { "type": "integer" },
                "processcreatetime": { "type": "date" },
                "process_path": { "type": "text", "analyzer": "custom_analyzer"},
                "process_command": { "type": "text", "analyzer": "custom_analyzer"},
                "user_name": { "type": "text", "analyzer": "custom_analyzer"},
                "digitalsignature": { "type": "text", "analyzer": "custom_analyzer"},
                "productname": { "type": "text", "analyzer": "custom_analyzer"},
                "fileversion": { "type": "text", "analyzer": "custom_analyzer"},
                "filedescription": { "type": "text", "analyzer": "custom_analyzer"},
                "companyname": { "type": "text", "analyzer": "custom_analyzer"},
                "priority": { "type": "text", "analyzer": "custom_analyzer"},
                "processMD5": { "type": "text", "analyzer": "custom_analyzer"},
                "parentProcessName": { "type": "text", "analyzer": "custom_analyzer"},
                "parentProcessPath": { "type": "text", "analyzer": "custom_analyzer"},
                "injectActive": { "type": "text", "analyzer": "custom_analyzer"},
                "processBeInjected": { "type": "integer"},
                "boot": { "type": "text", "analyzer": "custom_analyzer"},
                "hide": { "type": "text", "analyzer": "custom_analyzer"},
                "importOtherDLL": { "type": "text", "analyzer": "custom_analyzer"},
                "hook": { "type": "text", "analyzer": "custom_analyzer"},
                "processConnectIP": { "type": "text", "analyzer": "custom_analyzer"},
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