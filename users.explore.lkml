include: "user_joins.explore"
include: "users.view"
include: "states_acs.view"

explore: users {
  view_name: users
  extends: [user_joins]
  join: state_imported {
    sql_on: ${state_imported.state_name} = ${users.state};;
    relationship: one_to_many
  }
}
