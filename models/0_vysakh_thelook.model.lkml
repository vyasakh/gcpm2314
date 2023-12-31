connection: "thelook"

# include all the views
include: "/views/**/*.view.lkml"
include: "/te.dashboard.lookml"
include: "/Map_dashboard.dashboard.lookml"

datagroup: 0_vysakh_thelook_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_logghj;;
  max_cache_age: "1 hour"
}
explore: geolite_city_location {}
# persist_with: 0_vysakh_thelook_default_datagroup

access_grant: drishya {
  user_attribute: test1
  allowed_values: ["see"]
}
access_grant: ragha {
  user_attribute: test2
  allowed_values: ["see"]
}

explore: users {}
explore: dept {}

explore: employees {}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: flight_der {
  join: orders_der {
   type: left_outer
    sql_on: ${orders_der.id} = ${flight_der.id} ;;
   relationship: many_to_one
 }
  join: users_der {
    type: left_outer
     sql_on: ${orders_der.id} = ${users_der.id} ;;
    relationship: many_to_one
  }
}
explore:users_der {

}

explore: fligh_dupe {
  from: flights
  view_name: flights
  join: orders {
    type: left_outer
    sql_on: ${orders.user_id} = ${flights.id2} ;;
    relationship: many_to_one
  }
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: human {}



explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}



explore: persons {}


explore: products {}

explore: salary {
  join: dept {
    type: left_outer
    sql_on: ${salary.dept_id} = ${dept.dept_id} ;;
    relationship: many_to_one
  }

}


explore: flights {}
