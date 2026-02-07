module "networking" {
  source = "./modules/networking"

  vpc_name            = var.vpc_name
  vpc_cidr            = var.vpc_cidr
  availability_zones  = var.availability_zones
  private_subnets     = var.private_subnets
  public_subnets      = var.public_subnets
  cluster_name        = var.cluster_name
  environment         = var.environment
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id               = module.networking.vpc_id
  private_subnet_ids   = module.networking.private_subnet_ids

  node_group_name = var.node_group_name
  instance_types = var.instance_types
  min_size       = var.min_size
  max_size       = var.max_size
  desired_size   = var.desired_size

  environment = var.environment
}

