# Provider version is constrained to makor version 5 to allow
# compatible updates while preventing unexpected breaking changes
# from future major provider releases.
terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
