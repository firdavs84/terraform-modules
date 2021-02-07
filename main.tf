module "myvpc" {
  source = "./vpc"

}

module "myec2" {
  source = "./ec2"
  ec2-subnet = module.myvpc.mysubnet_id
  ec2-sgid = module.myvpc.mysg_id
  ec2-vpc    = module.myvpc.vpc_id
}

output "my-region" {
  value = var.my-region
}

variable "my-region" {
  type = string
}