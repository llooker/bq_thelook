view: orders {
  sql_table_name: lookerdata.thelook_web_analytics.order_items ;;

  dimension: id {
    type:number
    sql: ${TABLE}.order_id ;;
  }

  dimension: status {}

  dimension_group: created {
    type:time
    sql: TIMESTAMP(${TABLE}.created_at) ;;
  }

  measure: count {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, count]
  }
}
