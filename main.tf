module "network" {
  source = "./modules/network"
}

module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
}

module "rds" {
  source = "./modules/rds"
  vpc_id = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  app_sg_id = module.security.app_sg_id
}

module "ecs" {
  source = "./modules/ecs"
  vpc_id = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  app_sg_id = module.security.app_sg_id
  db_address = module.rds.db_address
  acm_certificate_arn = var.acm_certificate_arn
}
