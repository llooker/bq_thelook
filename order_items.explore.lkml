include: "users.view"
include: "inventory_items.view"
include: "products.view"
include: "distribution_centers.view"
include: "user_order_sequence.view"
include: "order_items.view"
include: "user_joins.explore"

include: "//dau_wau_mau_support__remote_dependency/dau_wau_mau_support.view"
view: +dau_wau_mau_support {
  dimension: date_to_use__input_field {sql:${order_items.created_date};;}
  dimension: user_id__input_field {sql:${order_items.user_id};;}
}
explore: order_items {
  extends: [user_joins,dau_wau_mau_explore_to_be_extended]
  join: users {relationship:many_to_one  sql_on: ${order_items.user_id} = ${users.id} ;;}
  join: inventory_items {relationship:many_to_one  sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;}
  join: products {relationship:many_to_one  sql_on: ${inventory_items.product_id} = ${products.id} ;;}
  join: distribution_centers {relationship:many_to_one  sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;}
  join: user_order_sequence {view_label:"Order Items"  relationship: many_to_one
    sql_on: ${user_order_sequence.order_id} = ${order_items.order_id} ;;}
}
