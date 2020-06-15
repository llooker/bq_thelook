include: "thelook_raw.layer"

explore: order_items {
  join: users {foreign_key: user_id}
  join: inventory_items {foreign_key: inventory_item_id}
  join: products {foreign_key: inventory_items.product_id}
}

view: +users {
  drill_fields: [id, last_name, first_name, events.count, order_items.count]
}

view: +products {
  drill_fields: [id, name, brand,category, inventory_items.count, order_items.count ]

  measure: brand_list {
    type:list
    list_field:brand
  }
  measure: category_list {
    type:list
    list_field:category
  }
  measure: category_count {
    type: count_distinct
    sql: ${category} ;;
    drill_fields: [category, brand_count, products.count, orders.count]
  }
  measure: brand_count {
    type: count_distinct
    sql: ${brand} ;;
    drill_fields: [brand, category_count, products.count, orders.count]
  }
}

view: +order_items {
  drill_fields: [id, created_date, user_id, sale_price]
  measure: total_revenue {
    type:sum sql: ${sale_price} ;;
    value_format_name: usd_0
  }
  measure: order_count {
    type:count_distinct
    sql: ${order_id} ;;
    drill_fields: [order_id, count]
  }
}
