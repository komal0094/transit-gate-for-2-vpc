# provider "aws" {
#   region     = "us-east-1"
#    }

   module "ec2" {
    source = "./module/ec2"
    ami = var.ami-1
    insta-type =var.instance_type1
    key_name = var.key1
    sg = lookup(module.sg.output-sg, "wp-sg", null)
    sg2 = lookup(module.sg2.output-sg, "mysql-sg", null)
    environment = var.env
    iam-access = module.iam.iam-profile
   ec2-sub = {
    wp-ec2 = {
         pub-snet = lookup(module.nw.pub-snet-id, "pub-sub-1", null)
         hostname = "wordpress"
      }
  }
  ec2-sub2 = {
    mysql-ec2 = {
         pub-snet2 = lookup(module.nw2.pub-snet-id, "pub-sub-2", null)
         hostname = "mysql"
      }
  }

   }
  