# Set variable values that composed of other variables
# https://www.terraform.io/language/values/locals

locals {

  app_service_plan_name = "snint-asp-01" # E.G. "snint${local.env}asp001"

  env_map = {
    Development = "dev",
    Testing     = "tst",
    Staging     = "stg",
    Production  = "prd",
    Shared      = "shrd",
    POC         = "poc"
  }


  log_analytics_workspace_name = "correctLawValue" # E.G. snint${local.env}law001 for azure integrations

  sensitive_app_settings = {
  }

  # Other app settings that need to be constructed from one or more terraform variables

  additional_app_settings = merge(local.sensitive_app_settings, var.additional_app_settings, local.other_app_settings)
}
