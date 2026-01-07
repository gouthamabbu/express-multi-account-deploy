provider "aws" {
  region = var.region
}

module "network" {
  source = "../../modules/network"

  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24","10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.2.0/24","10.0.4.0/24"]
  azs                  = ["ap-south-1a","ap-south-1b"]
}

module "iam_ec2" {
  source = "../../modules/iam-ec2"
}

module "iam_github" {
  source      = "../../modules/iam-github"
  github_repo = var.github_repo
}

module "alb" {
  source            = "../../modules/alb"
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  instance_id       = module.compute.instance_id
}

module "compute" {
  source              = "../../modules/compute"
  vpc_id              = module.network.vpc_id
  private_subnet_id   = module.network.private_subnet_ids[0]
  iam_instance_profile = module.iam_ec2.instance_profile_name
  allowed_sg_id       = module.alb.alb_sg_id
}

