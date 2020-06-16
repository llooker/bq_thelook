connection: "bigquery_publicdata_standard_sql"
include: "thelook_all.layer"

view: +order_items {
  sql_table_name: lookerdata.thelook_web_analytics.order_items ;;
  dimension_group: created {sql: TIMESTAMP(${EXTENDED}) ;;}
}

view: +users {
  sql_table_name: thelook_web_analytics.users ;;
}

view: +inventory_items {
  sql_table_name: thelook_web_analytics.inventory_items ;;
}

view: +products {
  sql_table_name: thelook_web_analytics.products ;;
}


view: +distribution_centers {
  sql_table_name: thelook_web_analytics.distribution_centers ;;
}

view: +events {
  sql_table_name: thelook_web_analytics.events ;;
}
