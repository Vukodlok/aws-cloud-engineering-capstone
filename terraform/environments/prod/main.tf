provider "aws" {
    region = var.aws_region
}

module "network" {
    source = "../../modules/network"

    environment = var.environment

    vpc_cidr = var.vpc_cidr

    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr

    public_availability_zone = var.public_availability_zone
    private_availability_zone = var.private_availability_zone
}