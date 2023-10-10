view: salary {
  sql_table_name: demo_db.Salary ;;


  parameter: select {
    type: unquoted

    allowed_value: {
      value: "point1"
      label: "p1"
    }
    allowed_value: {
      value: "point2"
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

    sql: {% if select._parameter_value == 'point1' %}
      ${salary}/2
    {% elsif select._parameter_value == 'point2' %}
      ${salary}/1
    {% else %}
      ${salary}
    {% endif %};;
  }
  measure: count {
    type: count
    drill_fields: [dept.dept_id, dept.dept_name]
  }
}
