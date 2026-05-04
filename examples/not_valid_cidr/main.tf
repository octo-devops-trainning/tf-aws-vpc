module "awesome-vpc" {
  source   = "../../"
  vpc_cidr = "not_valid"
  vpc_tags = {
    "Name" : "Complete vpc",
    "Environment" : "dev"
  }
  enable_dns_hostnames = false
  enable_dns_support   = true
}