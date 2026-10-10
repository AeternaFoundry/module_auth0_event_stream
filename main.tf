resource "auth0_event_stream" "event_streams" {
  for_each = var.event_streams

  destination_type = each.value.destination_type
  name             = each.value.name
  subscriptions    = each.value.subscriptions
  status           = each.value.status

  dynamic "action_configuration" {
    for_each = each.value.action_configuration != null ? [each.value.action_configuration] : []
    content {
      action_id = action_configuration.value.action_id
    }
  }

  dynamic "eventbridge_configuration" {
    for_each = each.value.eventbridge_configuration != null ? [each.value.eventbridge_configuration] : []
    content {
      aws_account_id = eventbridge_configuration.value.aws_account_id
      aws_region     = eventbridge_configuration.value.aws_region
    }
  }

  dynamic "webhook_configuration" {
    for_each = each.value.webhook_configuration != null ? [each.value.webhook_configuration] : []
    content {
      webhook_authorization {
        header_key              = webhook_configuration.value.webhook_authorization.header_key
        header_value            = webhook_configuration.value.webhook_authorization.header_value
        header_value_wo         = webhook_configuration.value.webhook_authorization.header_value_wo
        header_value_wo_version = webhook_configuration.value.webhook_authorization.header_value_wo_version
        method                  = webhook_configuration.value.webhook_authorization.method
        password                = webhook_configuration.value.webhook_authorization.password
        password_wo             = webhook_configuration.value.webhook_authorization.password_wo
        password_wo_version     = webhook_configuration.value.webhook_authorization.password_wo_version
        token                   = webhook_configuration.value.webhook_authorization.token
        token_wo                = webhook_configuration.value.webhook_authorization.token_wo
        token_wo_version        = webhook_configuration.value.webhook_authorization.token_wo_version
        username                = webhook_configuration.value.webhook_authorization.username
      }
      webhook_endpoint = webhook_configuration.value.webhook_endpoint
    }
  }
}

