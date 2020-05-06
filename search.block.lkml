explore: search_suggest {
  extension: required
  from: search_suggest
  view_name: search_suggest
  hidden:yes
  case_sensitive:no
  query: search_for_a_term {
    dimensions: [search_field]
    measures: [total_weight, value_count]
    filters: [search_suggest.search_term: "%a%"]
    limit: 500
  }
  query: top_values_by_weight {
    dimensions: [search_value]
    measures: [total_weight]
    sorts: [total_weight: desc]
    limit: 10
  }
}

# Should really be part of the block..
#
# explore: search_joins {
#   extension: required
#   join: search_map {
#     sql: JOIN UNNEST(${search_map.map}) search_map ;;
#   }
# }

view: search_map {
  dimension: __search_field {}
  dimension: __search_value {}
  dimension: __search_term { sql: ${__search_field} ||':'||${__search_value} ;;}
  measure: __search_weight {
    type: number
    sql: COUNT(*) ;;
  }
}

view: search_suggest {
  dimension: search_field {}
  dimension: search_value {}
  dimension: search_term { sql: ${search_field} ||':'||${search_value} ;;}
  dimension: search_weight {type: number}
  measure: total_weight {type:sum sql:${search_weight};; }
  measure: value_count {
    type:count_distinct  sql:${search_value} ;;
    drill_fields: [search_value, search_weight]
  }
}
