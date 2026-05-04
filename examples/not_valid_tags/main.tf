module "awesome-vpc" {
  source   = "../../"
  vpc_cidr = "10.0.0.0/16"
  vpc_tags = {
    "Not_valid" : "Not valid",
  }
  enable_dns_hostnames = false
  enable_dns_support   = true
}