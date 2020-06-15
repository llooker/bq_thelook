include: "helper.layer"

view: +numbers {
  derived_table: {
    sql:
      WITH b AS (
       SELECT 0 as n
        UNION SELECT 1
        UNION SELECT 2
        UNION SELECT 3
        UNION SELECT 4
        UNION SELECT 5
        UNION SELECT 6
        UNION SELECT 8
      )
      SELECT
      row_number() over() -1 as
        number FROM b,b as b1 ,b as b2, b as b3, b as b4, b as b5
          ;;
  }
  dimension: number {type:number}
}
