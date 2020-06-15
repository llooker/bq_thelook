connection: "bigquery_publicdata_standard_sql"
#connection: "docs_bigquery_db"

# include all the views
include: "*.view"

include: "*.explore"
include: "order_items_search.layer"



explore: event_sessions {
  extends: [user_joins]
  join: users {relationship:many_to_one  sql_on: ${users.id} = ${event_sessions.user_id} ;; }
  join: product_id {from:id  relationship:one_to_many
    sql: LEFT JOIN UNNEST(${event_sessions.product_ids_visited}) as product_id ;;}
  join: products {relationship:many_to_one  sql_on: ${product_id.id} = ${products.id} ;;}
}

include: "events_sessions_add_pop"
explore: +event_sessions {
  extends: [join_pop_standard_fields]
}
