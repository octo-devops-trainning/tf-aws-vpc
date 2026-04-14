output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.module_vpc.id
}

output "vpc_cidr_block" {
  description = "The IPv4 CIDR block for the VPC."
  value       = aws_vpc.module_vpc.cidr_block
}

output "vpc_tags" {
  description = "A map of tags for vpc resource."
  value       = aws_vpc.module_vpc.tags
}

output "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Default false"
  value       = aws_vpc.module_vpc.enable_dns_hostnames
}

output "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults to true."
  value       = aws_vpc.module_vpc.enable_dns_support
}