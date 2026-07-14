provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "AWS Cloud Engineering Capstone"
      ManagedBy   = "Terraform"
      Environment = var.environment
    }
  }
}