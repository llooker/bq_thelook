include: "helper.layer"
view: +numbers {
  sql_table_name: (SELECT number FROM UNNEST(GENERATE_ARRAY(0,10000)) number) ;;
}
