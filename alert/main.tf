data "newrelic_entity" "example_app" {
  name = "FoodMe" # Must be an exact match to your application name in New Relic
  domain = "APM" # or BROWSER, INFRA, MOBILE, SYNTH, depending on your entity's domain
  type = "APPLICATION"
}
# Error percentage
resource "newrelic_alert_condition" "error_percentage" {
  policy_id       = var.policy_id1
  name            = "High Error Percentage"
  type            = "apm_app_metric"
  entities        = [data.newrelic_entity.example_app.application_id]
  metric          = "error_percentage"
  runbook_url     = "https://www.example.com"
  condition_scope = "application"

  # Define a critical alert threshold that will trigger after 5 minutes above a 5% error rate.
  term {
    duration      = 5
    operator      = "above"
    threshold     = "5"
    time_function = "all"
  }
}
resource "newrelic_notification_destination" "team_email_destination" {
  name = "destination-info"
  type = "EMAIL"

  property {
    key = "email"
    value = "poojasangwan2612@gmail.com, rishurudrasingh@gmail.com"
}
}
resource "newrelic_notification_channel" "team_email_channel" {

  name = "channel-test"//"email-example2"
  type = "EMAIL"
  destination_id = newrelic_notification_destination.team_email_destination.id
 
  product = "IINT"

  property {
    key = "subject"
    value = "New Subject"
  }
}