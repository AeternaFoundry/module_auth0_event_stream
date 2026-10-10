variable "event_streams" {
  description = <<EOT
Map of event_streams, attributes below
Required:
    - destination_type
    - name
    - subscriptions
Optional:
    - status
    - action_configuration (block):
        - action_id (required)
    - eventbridge_configuration (block):
        - aws_account_id (required)
        - aws_region (required)
    - webhook_configuration (block):
        - webhook_authorization (required, block):
            - header_key (optional)
            - header_value (optional)
            - header_value_wo (optional)
            - header_value_wo_version (optional)
            - method (required)
            - password (optional)
            - password_wo (optional)
            - password_wo_version (optional)
            - token (optional)
            - token_wo (optional)
            - token_wo_version (optional)
            - username (optional)
        - webhook_endpoint (required)
EOT

  type = map(object({
    destination_type = string
    name             = string
    subscriptions    = list(string)
    status           = optional(string)
    action_configuration = optional(object({
      action_id = string
    }))
    eventbridge_configuration = optional(object({
      aws_account_id = string
      aws_region     = string
    }))
    webhook_configuration = optional(object({
      webhook_authorization = object({
        header_key              = optional(string)
        header_value            = optional(string)
        header_value_wo         = optional(string)
        header_value_wo_version = optional(number)
        method                  = string
        password                = optional(string)
        password_wo             = optional(string)
        password_wo_version     = optional(number)
        token                   = optional(string)
        token_wo                = optional(string)
        token_wo_version        = optional(number)
        username                = optional(string)
      })
      webhook_endpoint = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.event_streams : (
        v.status == null || (contains(["enabled", "disabled"], v.status))
      )
    ])
    error_message = "must be one of: \"enabled\", \"disabled\""
  }
  validation {
    condition = alltrue([
      for k, v in var.event_streams : (
        contains(["eventbridge", "webhook", "action"], v.destination_type)
      )
    ])
    error_message = "must be one of: \"eventbridge\", \"webhook\", \"action\""
  }
}

