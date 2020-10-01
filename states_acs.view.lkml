include: "//marketplace_acs_census/geography/state_core.view"
include: "//marketplace_acs_census/views/*"

view: state_imported {
  extends: [state, population, education]
}
