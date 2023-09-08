view: orders_der {
  derived_table: {
    sql: select id as id from demo_db.orders ;;
    #datagroup_trigger: 0_vysakh_thelook_default_datagroup
  }
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
  }
  measure: ticket_holds {
    type: sum
    sql:CASE
      WHEN ${users_der.if_holds} THEN ${id}
      ELSE 0
      END ;;
  }
  }
