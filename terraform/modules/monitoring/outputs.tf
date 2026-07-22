# ARN of the SNS topic used for infrastructure notifications.
output "sns_topic_arn" {
    description = "SNS topic ARN"

    value = aws_sns_topic.alerts.arn
}

# Name of the CloudWatch Log Group.
output "log_group_name" {
    description = "CloudWatch log group"

    value = aws_cloudwatch_log_group.application.name
}