# Environment is used to apply consistent naming and tagging
# across all compute resources.
variable "environment" {
    description = "Deployment environment"
    type        = string
}

variable "subnet_id" {
    description = "Subnet where the EC2 instance will be deployed"
    type        = string
}

# The compute module receives the VPC ID so it can create
# security groups within the cirrect network.
variable "vpc_id" {
    description = "VPC where compute resources will be deployed"
    type        = string
}

# Instance type is configurable so different environments
# can balance cost and performance without changing code.
variable "instance_type" {
    description = "EC2 instance type"
    type        = string
}