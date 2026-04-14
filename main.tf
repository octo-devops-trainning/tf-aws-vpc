resource "aws_vpc" "module_vpc" {
  cidr_block           = var.vpc_cidr
  tags                 = var.vpc_tags
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}