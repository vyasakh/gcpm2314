view: users_der {
  derived_table: {
    sql: select id as id, state as state from demo_db.users ;;
    #datagroup_trigger: 0_vysakh_thelook_default_datagroup
  }
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: if_holds {
    #hidden:  yes
    type: yesno
    sql: ${state} = 'Alaska' ;;
  }
}
