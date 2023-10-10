view: geolite_city_location {
  sql_table_name: geo.geolite_city_location ;;

  dimension: area_code {
    type: string
    sql: ${TABLE}.areaCode ;;
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
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: loc_id {
    type: number
    sql: ${TABLE}.locId ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: metro_code {
    type: string
    sql: ${TABLE}.metroCode ;;
  }
  dimension: postal_code {
    type: string
    sql: ${TABLE}.postalCode ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: loc_lat_lang  {
    type: location
    sql_latitude: ${latitude};;
    sql_longitude: ${longitude} ;;
  }
  measure: count {
    type: count
  }
}
