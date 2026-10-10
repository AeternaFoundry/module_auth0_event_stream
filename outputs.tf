output "event_streams_id" {
  description = "Map of id values across all event_streams, keyed the same as var.event_streams except keys with no id are omitted"
  value       = { for k, v in auth0_event_stream.event_streams : k => v.id if v.id != null && length(v.id) > 0 }
}
output "event_streams_action_configuration" {
  description = "Map of action_configuration values across all event_streams, keyed the same as var.event_streams except keys with no action_configuration are omitted"
  value       = { for k, v in auth0_event_stream.event_streams : k => one(v.action_configuration) if v.action_configuration != null && length(v.action_configuration) > 0 }
}
output "event_streams_created_at" {
  description = "Map of created_at values across all event_streams, keyed the same as var.event_streams except keys with no created_at are omitted"
  value       = { for k, v in auth0_event_stream.event_streams : k => v.created_at if v.created_at != null && length(v.created_at) > 0 }
}
output "event_streams_destination_type" {
  description = "Map of destination_type values across all event_streams, keyed the same as var.event_streams except keys with no destination_type are omitted"
  value       = { for k, v in auth0_event_stream.event_streams : k => v.destination_type if v.destination_type != null && length(v.destination_type) > 0 }
}
output "event_streams_eventbridge_configuration" {
  description = "Map of eventbridge_configuration values across all event_streams, keyed the same as var.event_streams except keys with no eventbridge_configuration are omitted"
  value       = { for k, v in auth0_event_stream.event_streams : k => one(v.eventbridge_configuration) if v.eventbridge_configuration != null && length(v.eventbridge_configuration) > 0 }
}
output "event_streams_name" {
  description = "Map of name values across all event_streams, keyed the same as var.event_streams except keys with no name are omitted"
  value       = { for k, v in auth0_event_stream.event_streams : k => v.name if v.name != null && length(v.name) > 0 }
}
output "event_streams_status" {
  description = "Map of status values across all event_streams, keyed the same as var.event_streams except keys with no status are omitted"
  value       = { for k, v in auth0_event_stream.event_streams : k => v.status if v.status != null && length(v.status) > 0 }
}
output "event_streams_subscriptions" {
  description = "Map of subscriptions values across all event_streams, keyed the same as var.event_streams except keys with no subscriptions are omitted"
  value       = { for k, v in auth0_event_stream.event_streams : k => v.subscriptions if v.subscriptions != null && length(v.subscriptions) > 0 }
}
output "event_streams_updated_at" {
  description = "Map of updated_at values across all event_streams, keyed the same as var.event_streams except keys with no updated_at are omitted"
  value       = { for k, v in auth0_event_stream.event_streams : k => v.updated_at if v.updated_at != null && length(v.updated_at) > 0 }
}
output "event_streams_webhook_configuration" {
  description = "Map of webhook_configuration values across all event_streams, keyed the same as var.event_streams except keys with no webhook_configuration are omitted"
  value       = { for k, v in auth0_event_stream.event_streams : k => one(v.webhook_configuration) if v.webhook_configuration != null && length(v.webhook_configuration) > 0 }
  sensitive   = true
}

