- dashboard: Map_dashboard
  title: Map_dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: tNZTGiX5aIRpxe1S3Ewd4e
  elements:
  - title: Map - UDD
    name: Map - UDD
    model: 0_vysakh_thelook
    explore: order_items
    type: looker_google_map
    fields: [users.country, users.count, users.id]
    sorts: [users.count desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    show_view_names: true
    defaults_version: 0
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 12
