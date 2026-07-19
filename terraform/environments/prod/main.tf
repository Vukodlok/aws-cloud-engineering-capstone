module "network" {
  source = "../../modules/network"

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

  public_availability_zone  = var.public_availability_zone
  private_availability_zone = var.private_availability_zone
}

module "compute" {
  source = "../../modules/compute"

  environment = var.environment

  vpc_id    = module.network.vpc_id
  subnet_id = module.network.private_subnet_id

  instance_type = var.instance_type
}

module "monitoring" {
  source = "../../modules/monitoring"

  environment        = var.environment
  instance_id        = module.compute.instance_id
  notification_email = var.notification_email
}