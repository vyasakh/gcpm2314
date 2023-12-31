view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  filter: filter {
    suggest_dimension: status
    type: string

    default_value: "Complete"
  }
  filter: filter2 {
    suggest_dimension: status
    sql:  status = 'Complete';;
    default_value: "Complete"
  }
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
    drill_fields: [detail*]
  }
  measure: count {
    type: count
    value_format: "$0.00"
    drill_fields: [drill_issue*]
    html:
    {% if orders.status == "COMPLETED" %}
    <p style="color: red; font-size: 50%">{{ rendered_value }}</p>
    {% elsif orders.status == "PENDING" %}
    <p style="color: blue; font-size:80%">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>
    {% endif %};;
  }

  measure: ticket_holds {
    type: sum_distinct
    sql_distinct_key: ${id} ;;

    sql:CASE
      WHEN ${users.if_holds} THEN ${id}
      ELSE 0
      END ;;
  }
  set: drill_issue {
    fields: [id, status,count,created_date]
  }
  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
