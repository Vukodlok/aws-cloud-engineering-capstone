# Environment names are restricted to approved deployment stages
# to prevent inconsistent resource naming and accidental deployments
# to unintended environments.
variable "environment" {
  description	 = "Deployment environment"
  type		 = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "vpc_cidr" {
  description	 = "CIDR block for the VPC"
  type		 = string
}

 variable "public_subnet_cidr" {
  description	 = "CIDR block for the public subnet"
  type		 = string
}

variable "private_subnet_cidr" {
  description 	= "CIDR block for the private subnet"
  type		= string
}

variable "public_availability_zone" {
  description = "Availability Zone for the public subnet"
  type        = string
}

variable "private_availability_zone" {
  description = "Availability Zone for the private subnet"
  type        = string
}