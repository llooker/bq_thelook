view: order_items {
  sql_table_name: lookerdata.thelook_web_analytics.order_items ;;

  dimension: id {primary_key:yes type:number}
  dimension_group: created {type:time sql: TIMESTAMP(${TABLE}.created_at) ;;}
  dimension: inventory_item_id {type:number}
  dimension: order_id {type:number}
  dimension: sale_price {type: number}
  dimension: status {}
  dimension: user_id {type: number}

  measure: count {type:count drill_fields: [id, created_date, user_id, sale_price]}
  measure: invoice_count {label:"Invoices sent" sql:${order_id} ;; type:count_distinct}
  measure: sales_made {label:"Sales made" sql:${order_id} ;; type:count_distinct}
  measure: total_revenue {type:sum sql: ${sale_price} ;;}
  measure: order_count {type:count_distinct sql: ${order_id} ;; drill_fields: [order_id, count]}
}
