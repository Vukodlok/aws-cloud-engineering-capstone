# Centralized log storage for infrastructure and future application logs.
# Log retention is configured to automatically remove older log data,
# demonstrating operational lifecycle management.
resource "aws_cloudwatch_log_group" "application" {
    name                = "/aws/ec2/${var.environment}"
    retention_in_days   = var.log_retention_days

    tags = {
        Name        = "${var.environment}-log-group"
        Environment = var.environment
    }
}

# SNS topic used to distribute operational alerts generated
# by CloudWatch alarms. Additional notification endpoints
# can be added in the future without modifying alarm resources.
resource "aws_sns_topic" "alerts" {
    name = "${var.environment}-alerts"

    tags = {
        Name        = "${var.environment}-alerts"
        Environment = var.environment
    }
}

# Email subscription for infrastructure alerts.
# AWS requires the recipient to confirm the subscription# before notifications will be delivered.
resource "aws_sns_topic_subscription" "email" {
    topic_arn = aws_sns_topic.alerts.arn

    protocol = "email"

    endpoint = var.notification_email
}

# Monitor EC2 CPU utilization and notify administrators
# if sustained utilization exceeds the defined threshold.
resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
    alarm_name          = "${var.environment}-high-cpu"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 2
    metric_name         = "CPUUtilization"
    namespace           = "AWS/EC2"
    period              = 300
    statistic           = "Average"
    threshold           = 70

    alarm_description = "Alarm when EC2 CPU utilization exceeds 70 percent."

    dimensions = {
        InstanceId = var.instance_id
    }

    alarm_actions = [
        aws_sns_topic.alerts.arn
    ]
}

# Monitor EC2 instance health using AWS status checks.
# This alarm detects infrastructure-level failures even
# when CPU utilization appears normal.
resource "aws_cloudwatch_metric_alarm" "status_check" {
    alarm_name          = "${var.environment}-status_check"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = 2
    metric_name         = "StatusCheckFailed"
    namespace           = "AWS/EC2"
    period              = 300
    statistic           = "Maximum"
    threshold           = 0

    alarm_description = "Alarm when EC2 instance status checks fail."

    dimensions = {
        InstanceId = var.instance_id
    }

    alarm_actions = [
        aws_sns_topic.alerts.arn
    ]
}