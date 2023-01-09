module "tg" {
 source = "./module/tg"
 vpc-01-id = module.nw.vpc-id
 vpc-02-id = module.nw2.vpc-id
 sub-1-id  = lookup(module.nw.pub-snet-id, "pub-sub-1", null)
 sub-2-id  = lookup(module.nw2.pub-snet-id, "pub-sub-2", null)
}