project_name: "bq_thelook"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
local_dependency: {
  project: "search_block"
}

local_dependency: {
  project: "marketplace_acs_census"
  override_constant: CONNECTION_NAME {
    value: "bq_thelook"
  }
}
