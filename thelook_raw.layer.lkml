
view: order_items {
  dimension: id {primary_key:yes type:number}
  dimension_group: created {type:time sql: ${TABLE}.created_at ;;}
  dimension: inventory_item_id {type:number}
  dimension: order_id {type:number}
  dimension: sale_price {type: number}
  dimension: status {}
  dimension: user_id {type: number}
  measure: count {type:count}
}

view: users {
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
  measure: count {type:count}
}

view: inventory_items {
  dimension: id {primary_key:yes type:number}
  dimension: cost {type:number}
  dimension: created_at {}
  dimension: product_brand {}
  dimension: product_category {}
  dimension: product_department {}
  dimension: product_distribution_center_id {type:number}
  dimension: product_id {type:number}
  dimension: product_name {}
  dimension: product_retail_price {type:number}
  dimension: product_sku {}
  dimension: sold_at {}
  measure: count {type:count}
}

view: products {
  dimension: id {primary_key:yes  type:number  sql: ${TABLE}.id ;;}
  dimension: brand {sql: ${TABLE}.brand ;;}
  dimension: category {sql: ${TABLE}.category ;;}
  dimension: cost {type:number  sql: ${TABLE}.cost ;;}
  dimension: department {sql: ${TABLE}.department ;;}
  dimension: distribution_center_id {type:number  sql: ${TABLE}.distribution_center_id ;;}
  dimension: name {sql: ${TABLE}.name ;;}
  dimension: retail_price {type:number  sql: ${TABLE}.retail_price ;;}
  dimension: sku {sql: ${TABLE}.sku ;;}
  measure: count {type:count}
}


view: distribution_centers {
  dimension: id {primary_key:yes  type:number}
  dimension: latitude {type:number}
  dimension: longitude {type:number}
  dimension: name {}
  measure: count {type:count}
}

view: events {
  dimension: id {primary_key:yes  type:number}
  dimension: browser {}
  dimension: city {}
  dimension: country {}
  dimension_group: created {type:time  sql: ${TABLE}.created_at ;;}
  dimension: event_type {}
  dimension: ip_address {}
  dimension: latitude {type:number}
  dimension: longitude {type:number}
  dimension: os {}
  dimension: sequence_number {type:number}
  dimension: session_id {}
  dimension: state {}
  dimension: traffic_source {}
  dimension: uri {}
  dimension: user_id {type:number  sql: CAST(REGEXP_EXTRACT(${TABLE}.user_id, r'\d+') AS INT64) ;;}
  dimension: zip {}
  measure: count {type:count}
}
