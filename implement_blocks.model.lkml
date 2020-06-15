connection: "bigquery_publicdata_standard_sql"

include: "order_items.view"

include: "//retail_block/lib/retail_lifetime_value.block"
include: "//retail_block/lib/retail_transaction_sequence.block"

#hid original field that has the same name as the template examples, as we are testing it on a custom field instead.
view: +order_items {
  dimension_group:created{hidden:yes}
  dimension_group: created_plus_1 {
    label: "Special Label"
    type:time
    timeframes: [raw,hour,date,week,month,quarter,year,day_of_month,day_of_week,week_of_year,minute]
    sql: timestamp_add(TIMESTAMP(${TABLE}.created_at), interval 1 day) ;;
    # datatype: date
    # timeframes: [raw,date,week,month,quarter,year,day_of_month,day_of_week,week_of_year]
    # sql: date(timestamp(${TABLE}.created_at)) ;;

  }
}
include: "//retail_block/lib/Period_Over_Period/pop_support.lkml"
explore: order_items {}
