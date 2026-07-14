# Instance ID is exposed so other infrastructure components
# can refereence this server without accessing module internals.
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.main.id
}

# Private IP may be needed by future application or monitoring
# components that communicate with this server internally.
output "private_ip" {
  description = "Private IP addresses of the EC2 instance"
  value       = aws_instance.main.private_ip
}

# Security group ID allows future resources to reference
# this security boundary if additional rules are required.
output "security_group_id" {
  description = "ID of the EC2 security group"
  value       = aws_security_group.ec2.id
}