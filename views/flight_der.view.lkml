view: flight_der {
  derived_table: {
    sql: select id2 as id from demo_db.flights ;;
    #datagroup_trigger: 0_vysakh_thelook_default_datagroup
  }
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }
}
