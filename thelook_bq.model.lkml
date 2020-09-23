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

explore: order_items_with_100_joins {
  label: "Stress Test 100 joins"
  view_name: order_items

  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }

  join: users2 {from:users foreign_key: users.id}
  join: users3 {from:users foreign_key: users.id}
  join: users4 {from:users foreign_key: users.id}
  join: users5 {from:users foreign_key: users.id}
  join: users6 {from:users foreign_key: users.id}
  join: users7 {from:users foreign_key: users.id}
  join: users8 {from:users foreign_key: users.id}
  join: users9 {from:users foreign_key: users.id}
  join: users10 {from:users foreign_key: users.id}
  join: users11 {from:users foreign_key: users.id}
  join: users12 {from:users foreign_key: users.id}
  join: users13 {from:users foreign_key: users.id}
  join: users14 {from:users foreign_key: users.id}
  join: users15 {from:users foreign_key: users.id}
  join: users16 {from:users foreign_key: users.id}
  join: users17 {from:users foreign_key: users.id}
  join: users18 {from:users foreign_key: users.id}
  join: users19 {from:users foreign_key: users.id}
  join: users20 {from:users foreign_key: users.id}
  join: users21 {from:users foreign_key: users.id}
  join: users22 {from:users foreign_key: users.id}
  join: users23 {from:users foreign_key: users.id}
  join: users24 {from:users foreign_key: users.id}
  join: users25 {from:users foreign_key: users.id}
  join: users26 {from:users foreign_key: users.id}
  join: users27 {from:users foreign_key: users.id}
  join: users28 {from:users foreign_key: users.id}
  join: users29 {from:users foreign_key: users.id}
  join: users30 {from:users foreign_key: users.id}
  join: users31 {from:users foreign_key: users.id}
  join: users32 {from:users foreign_key: users.id}
  join: users33 {from:users foreign_key: users.id}
  join: users34 {from:users foreign_key: users.id}
  join: users35 {from:users foreign_key: users.id}
  join: users36 {from:users foreign_key: users.id}
  join: users37 {from:users foreign_key: users.id}
  join: users38 {from:users foreign_key: users.id}
  join: users39 {from:users foreign_key: users.id}
  join: users40 {from:users foreign_key: users.id}
  join: users41 {from:users foreign_key: users.id}
  join: users42 {from:users foreign_key: users.id}
  join: users43 {from:users foreign_key: users.id}
  join: users44 {from:users foreign_key: users.id}
  join: users45 {from:users foreign_key: users.id}
  join: users46 {from:users foreign_key: users.id}
  join: users47 {from:users foreign_key: users.id}
  join: users48 {from:users foreign_key: users.id}
  join: users49 {from:users foreign_key: users.id}
  join: users50 {from:users foreign_key: users.id}
  join: users51 {from:users foreign_key: users.id}
  join: users52 {from:users foreign_key: users.id}
  join: users53 {from:users foreign_key: users.id}
  join: users54 {from:users foreign_key: users.id}
  join: users55 {from:users foreign_key: users.id}
  join: users56 {from:users foreign_key: users.id}
  join: users57 {from:users foreign_key: users.id}
  join: users58 {from:users foreign_key: users.id}
  join: users59 {from:users foreign_key: users.id}
  join: users60 {from:users foreign_key: users.id}
  join: users61 {from:users foreign_key: users.id}
  join: users62 {from:users foreign_key: users.id}
  join: users63 {from:users foreign_key: users.id}
  join: users64 {from:users foreign_key: users.id}
  join: users65 {from:users foreign_key: users.id}
  join: users66 {from:users foreign_key: users.id}
  join: users67 {from:users foreign_key: users.id}
  join: users68 {from:users foreign_key: users.id}
  join: users69 {from:users foreign_key: users.id}
  join: users70 {from:users foreign_key: users.id}
  join: users71 {from:users foreign_key: users.id}
  join: users72 {from:users foreign_key: users.id}
  join: users73 {from:users foreign_key: users.id}
  join: users74 {from:users foreign_key: users.id}
  join: users75 {from:users foreign_key: users.id}
  join: users76 {from:users foreign_key: users.id}
  join: users77 {from:users foreign_key: users.id}
  join: users78 {from:users foreign_key: users.id}
  join: users79 {from:users foreign_key: users.id}
  join: users80 {from:users foreign_key: users.id}
  join: users81 {from:users foreign_key: users.id}
  join: users82 {from:users foreign_key: users.id}
  join: users83 {from:users foreign_key: users.id}
  join: users84 {from:users foreign_key: users.id}
  join: users85 {from:users foreign_key: users.id}
  join: users86 {from:users foreign_key: users.id}
  join: users87 {from:users foreign_key: users.id}
  join: users88 {from:users foreign_key: users.id}
  join: users89 {from:users foreign_key: users.id}
  join: users90 {from:users foreign_key: users.id}
  join: users91 {from:users foreign_key: users.id}
  join: users92 {from:users foreign_key: users.id}
  join: users93 {from:users foreign_key: users.id}
  join: users94 {from:users foreign_key: users.id}
  join: users95 {from:users foreign_key: users.id}
  join: users96 {from:users foreign_key: users.id}
  join: users97 {from:users foreign_key: users.id}
  join: users98 {from:users foreign_key: users.id}
  join: users99 {from:users foreign_key: users.id}
  join: users100 {from:users foreign_key: users.id}
}
