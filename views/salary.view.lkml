view: salary {
  sql_table_name: demo_db.Salary ;;


  parameter: param {
    type: unquoted
    default_value: "see below"
    allowed_value: {
      value: "point 1"
      label: "p1"
    }
    allowed_value: {
      value: "point 2"
      label: "p2"
    }
  }
  dimension: dept_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.DeptID ;;
  }
  dimension: salary {
    type: number
    sql: ${TABLE}.Salary ;;
  }
  dimension: set {
    type: string
    sql: ${param} ;;
  }
  measure: count {
    type: count
    drill_fields: [dept.dept_id, dept.dept_name]
  }
}
