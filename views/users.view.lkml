view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [0,10,20,30,40,50,60,70,80]
    style: integer
    sql: ${age} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: countylo {

    type: string
    map_layer_name: us_counties_fips
    sql: ${city} ;;
  }

  dimension: statelo {

    type: string
    map_layer_name: us_states
    sql: ${state} ;;
  }

  dimension: citylo {

    type: string
    map_layer_name: us_counties_fips
    sql: ${zip} ;;
  }
  measure: ageavg {
    type: average
    sql: ${age} ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  measure: first_name_measure {
    label: "first name"
    type: string
    sql: ${first_name} ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  dimension: ticket_sign {
    hidden: yes
    type: number
    sql: CASE
      WHEN ${country} = 'USA' AND ${state} LIKE 'Alaba%' THEN 1
      WHEN ${state} = 'lowa' AND ${id}=10 THEN -1
      ELSE 0
      END ;;
  }

  dimension: if_holds {
    #hidden:  yes
    type: yesno
    sql: ${state} = 'Alaska' ;;
  }
  measure: ticket_holds {
    type: sum
    sql:CASE
      WHEN ${users.if_holds} THEN ${ticket_sign}
      ELSE 0
      END ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  first_name,
  last_name,
  events.count,
  orders.count,
  saralooker.count,
  sindhu.count,
  user_data.count
  ]
  }

}
