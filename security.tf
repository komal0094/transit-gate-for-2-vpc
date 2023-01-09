# provider "aws" {
#   region     = "us-east-1"
#    }

   module "sg" {
    source = "./module/sg"
   vpc_id = module.nw.vpc-id
   sg_details = var.sg_details
   }


   module "sg2" {
    source = "./module/sg"
   vpc_id = module.nw2.vpc-id
   sg_details = var.sg_details2
   
   }
   

