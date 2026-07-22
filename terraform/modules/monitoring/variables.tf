# Deployment environment used for naming AWS resources consistently.
variable "environment" {
    description = "Development environment"

    type = string
}

# EC2 instance monitored by CloudWatch alarms.
variable "instance_id" {
    description = "EC2 instance ID"

    type = string
}

# Email address that receives CloudWatch alarm notifications.
# AWS will send a confirmation email after the SNS subscription
# is created. Notifications begin only after confirmation.
variable "notification_email" {
    description = "Email address for SNS notifications"

    type = string
}

# Number of days CloudWatch Logs are retained before automatic deletion. 
# A short reention period keeps costs low while demonstrating
# log lifecycle management.
variable "log_retention_days" {
    description = "CloudWatch log retention"

    type    = number
    default = 30
}