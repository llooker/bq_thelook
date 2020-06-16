include: "thelook_basic.layer"

explore: +order_items {
  join: user_order_facts {foreign_key:order_items.user_id}
}

view: user_order_facts {
  label: "Users"
  derived_table: {
    explore_source: order_items {
      column: user_id {field:order_items.user_id}
      column: lifetime_revenue {field:order_items.total_revenue}
      column: lifetime_number_of_orders {field:order_items.order_count}
      column: lifetime_product_categories {field:products.category_list}
      column: lifetime_brands {field:products.brand_list}
    }
  }
  dimension: user_id {hidden:yes primary_key:yes}
  dimension: lifetime_revenue {type:number}
  dimension: lifetime_number_of_orders {type:number}
  dimension: lifetime_product_categories {}
  dimension: lifetime_brands {}
}
