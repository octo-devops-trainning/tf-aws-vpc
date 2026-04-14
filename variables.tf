variable "vpc_cidr" {
  description = "vpc cidr"
  type        = string
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "Must be a valid IPv4 CIDR block (e.g, 10.0.0.0/16)"
  }
}

variable "vpc_tags" {
  description = "A map of tags for vpc resource."
  type = object({
    Name        = string,
    Environment = string
  })
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Default false"
  type        = bool
  default     = false
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults to true."
  type        = bool
  default     = true
}