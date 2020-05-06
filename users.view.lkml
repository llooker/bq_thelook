view: users {
  sql_table_name: thelook_web_analytics.users ;;

  dimension: id {primary_key:yes}
  dimension: age {type:number}
  dimension: city {}
  dimension: country {}
  dimension_group: created {type:time  sql:${TABLE}.created_at ;;}
  dimension: email {}
  dimension: first_name {}
  dimension: gender {}
  dimension: last_name {}
  dimension: state {}
  dimension: zip {type: zipcode}
  measure: count {type:count
    drill_fields: [id, last_name, first_name, events.count, order_items.count]}
}
