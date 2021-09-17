provider "aws" {
  region = var.region
}

# #############################################################################
# (REQUIRED) Create a unique ID to identify each GHES stack
# #############################################################################
module "global" {
  source = "./modules/global"
  region = var.region
}

# #############################################################################
# (REQUIRED) Create Network Infrastructure for the stack
# #############################################################################
module "network" {
  source        = "./modules/network"
  stack_id      = module.global.stack_id
  subnet_layers = var.subnet_layers
  stack_name    = var.stack_name
  region        = var.region
}

# #############################################################################
# (REQUIRED) Create a Bastion host for the stack
# #############################################################################
module "bastion" {
  source     = "./modules/compute-bastion"
  stack_id   = module.global.stack_id
  subnet_ids = module.network.public_subnet_ids
  stack_name = var.stack_name
  region     = var.region
  vpc_id     = module.network.vpc_id
  key_name   = var.key_name
  pub_key    = var.pub_key
}
