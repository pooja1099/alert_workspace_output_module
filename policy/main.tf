resource "newrelic_alert_policy" "mypolicy" {
  name = var.name
  incident_preference =  var.incident_preference  # PER_POLICY is default
}
 output "policy_id" {
  value = newrelic_alert_policy.mypolicy.id
}
