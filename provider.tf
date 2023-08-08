terraform {
  # Require Terraform version 1.0 (recommended)
  required_version = "~> 1.0"

  # Require the latest 2.x version of the New Relic provider
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"

    }
  }
}
provider "newrelic" {
  account_id = "*******"
  api_key    = "NRAK-******************" # usually prefixed with 'NRAK'
  region     = "US"                               # Valid regions are US and EU
}