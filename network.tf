provider "aws" {
  region     = "us-east-1"
   }

module "nw" {
source = "./module/nw"
vpc_cidr = var.cidr_block
environment = var.env
pub-snets = var.pub-snet-detail
rt-cidr = var.cidr_block2
transit_gateway_id = module.tg.tg
}

module "nw2" {
source = "./module/nw"
vpc_cidr = var.cidr_block2
environment = var.env2
pub-snets = var.pub-snet-detail2
transit_gateway_id = module.tg.tg
rt-cidr = var.cidr_block
}