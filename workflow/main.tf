resource "newrelic_workflow" "team_workflow" {
  
  name = "workflows1"
  enrichments_enabled = true
  destinations_enabled = true
  enabled = true
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "filter-example"
    type = "FILTER"

    predicate {
      attribute = "accumulations.sources"
      operator = "EXACTLY_MATCHES"
      values = [ "newrelic" ]
    }
  }

  destination {
    channel_id = var.channel_id1
  }
}