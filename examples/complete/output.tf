output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.awesome-vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The IPv4 CIDR block for the VPC."
  value       = module.awesome-vpc.vpc_cidr_block
}

output "vpc_tags" {
  description = "A map of tags for vpc resource."
  value       = module.awesome-vpc.vpc_tags
}

output "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Default false"
  value       = module.awesome-vpc.enable_dns_hostnames
}

output "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults to true."
  value       = module.awesome-vpc.enable_dns_support
}