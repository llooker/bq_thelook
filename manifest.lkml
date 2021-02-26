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

application: log_analytics {
  file: "bundle.js"

#url: "http://localhost:8080/bundle.js"

  label: "Log Analytics"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    core_api_methods: [
      "run_inline_query",
      "lookml_model_explore",
      "create_query"
    ]

    oauth2_urls: ["https://accounts.google.com/o/oauth2/v2/auth", "https://github.com/login/oauth/authorize", "https://dev-5eqts7im.auth0.com/authorize", "https://dev-5eqts7im.auth0.com/login/oauth/token", "https://github.com/login/oauth/access_token"]
  }
}
