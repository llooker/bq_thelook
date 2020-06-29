#
# Unfied Single Filter
#

include: "order_items.explore"
#include: "search.block"
include: "//search_block/lib/search.block"

explore: +order_items {
  #extends: [search_joins]   # extension not allowed in refinement!
  join: search_map {
    sql: JOIN UNNEST(${search_map.map}) search_map ;;
    relationship: one_to_many
  }
}

view: +order_items {
  # extends: [view_search]   # extension required not allowed in refinement!
  filter: search {
    suggest_dimension: search_suggest.search_term
    suggest_explore: flights_search
    sql:
       {%condition%} ${search_map.search_term} {%endcondition%};;
  }
}

explore: order_items_search {
  extends: [search_suggest]
}


view: +search_map {
  dimension: map {
    sql:
      [
        STRUCT('products.brand' as search_field, ${products.brand} as search_value),
        STRUCT('products.category', ${products.category}),
        STRUCT('products.name', ${products.name}),
        STRUCT('products.department', ${products.department}),
        STRUCT('users.name', ${users.name}),
        STRUCT('users.city', ${users.city}),
        STRUCT('users.state', ${users.state}),
        STRUCT('users.email', ${users.email}),
        STRUCT('users.zip', ${users.zip}),
        STRUCT('users.first_name', ${users.first_name})

      ]
    ;;
  }
}

# all this exists because we can't change the explore_source name, should be a query object.
view: +search_suggest {
  derived_table: {
    persist_for: "24 hours"
    explore_source: order_items {
      column: search_value {
        field: search_map.search_value
      }
      column: search_weight {
        field: search_map.search_weight
      }
      column: search_field {
        field: search_map.search_field
      }
    }
  }
  measure: total_weight {
    link: {
      url: "order_items?f[{{search_field._value}}]={{search_value._value}}&fields=search_map.search_field,search_map.search_value,search_map.search_weight,search_map.tell_me_more"
      label: "Tell Me More"
    }
  }
}
