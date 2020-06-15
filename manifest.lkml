project_name: "bq_thelook"

local_dependency: {
  project: "retail_block"
  override_constant: example_data {value:"README*"}
  override_constant: transactions {value:"order_items"}
  override_constant: customer_label {value:"Users"}
  override_constant: transaction_label {value:"Orders"}
  override_constant: item_label {value:"Order Items"}
  override_constant: customer_id {value:"order_items.user_id"}
  override_constant: customer_string {value:"users.email"}
  override_constant: transaction_time {value:"order_items.created_raw"}
  override_constant: transaction_id {value:"order_items.order_id"}
  override_constant: revenue {value:"order_items.total_revenue"}
  override_constant: transaction_count {value:"order_items.order_count"}
  override_constant: customer_count {value:"users.count"}

  override_constant: product_view {value:"products"}
  override_constant: product_id {value:"inventory_items.product_id"}
  override_constant: product_category_column {value:"category"}
  override_constant: product_brand_column {value:"brand"}
  override_constant: product_name_column {value:"name"}
  override_constant: product_id {value:"inventory_items.product_id"}

  #km pop constants#
  override_constant: pop_base_field_name {value:"created_plus_1"}
  override_constant: pop_base_field_label {value:"Special Label"}
  override_constant: pop_base_field_group_label {value:"Special Label Date"}

  override_constant: my_dimension_group_timeframes {value: "raw,date,week,month,quarter,year,day_of_month,day_of_week,week_of_year"}
  override_constant: my_dimension_group_datatype {value: "timestamp"}
  # override_constants: [

  #   # some weird housekeeping
  #   example_data: "",

  #   # explores
  #   transactions: "order_items",

  #   # view labels
  #   customer_label: "Users",
  #   transaction_label:"Orders",
  #   item_label: "Order Items",

  #   # Dimension Fields
  #   customer_id: "order_items.user_id",
  #   customer_string: "users.email",
  #   transaction_time: "order_items.created_raw",
  #   transaction_id: "order_items.order_id",

  #   # Measure Fields
  #   revenue: "order_items.total_revenue",
  #   transaction_count: "order_items.order_count",
  #   customer_count: "users.count",

  #   # Affinity Analysis
  #   product_view: "products",
  #   product_id: "inventory_items.product_id",

  #   product_category_column: "category",
  #   product_brand_column: "brand",
  #   product_name_column: "name"

  # ]
}
