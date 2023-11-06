view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: phone {
    required_access_grants: [drishya]
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: phones {

    type: string
    sql: ${TABLE}.phones ;;
  }

  dimension_group: returned {
    type: time
    #timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
     required_access_grants: [ragha]
    type: number
    sql: ${TABLE}.sale_price ;;
  }

   dimension: period_selected_test {
    type: string
    sql: CASE
      WHEN ${returned_date} >= DATE_ADD(CURRENT_DATE(),INTERVAL -1 YEAR)
      THEN 'Current Period'
      ELSE 'Previous Period'
      END ;;
  }
  measure: count_new {
    type: count
    filters: [period_selected_test: "Current Period"]
  }

  dimension: dee2 {
    sql: ${id}+2 ;;
    required_access_grants: [drishya]
  }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
  measure: count_old {
    type: count
    filters: [period_selected_test: "Previous Period"]
    #filters: [returned_month_name: "July", returned_day_of_year: "2023"]
  }
}
