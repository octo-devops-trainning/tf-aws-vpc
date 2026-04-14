# TF-AWS-VPC
Module to crete a custom AWS VPC

## Architecture

Diagram showing the resources created and their relationships.

       AWS
        |
       VPC

## Requirements

- Terraform version: v1.14.8
- Golang version: v1.26.0
- Provider versions:
    - hashicorp/aws: 5.11.0
- [Localstack](https://www.localstack.cloud/)
- Docker: v29.4.0

## Usage
```hcl
module "awesome-vpc" {
    source = "./"
    vpc_cidr           = "10.0.0.0/16"
    vpc_tags                 = {
        "Name": "Awesome",
        "Environment": "dev"
    }
    enable_dns_hostnames = true
    enable_dns_support   = false
}
```

## Inputs
<table>
<tr>
    <th>Name</th>
    <th>Description</th>
    <th>Type</th>
    <th>Default </th>
    <th>Required</th>
    <th>Example</th>
</tr>
<tr>
<td>vpc_cidr</td>
<td>The IPv4 CIDR block for the VPC</td>
<td>string</td>
<td>No</td>
<td>Yes</td>
<td>10.0.0.0/16</td>
</tr>
<tr>
<td>vpc_tags</td>
<td>A map of tags to assign to the resource.</td>
<td>map</td>
<td>
No
</td>
<td>Yes</td>
<td>

```json
{
    "Name": "Awesome",
    "Environment": "dev"
}
```
</td>
</tr>
<tr>
<td>enable_dns_hostnames</td>
<td> A boolean flag to enable/disable DNS hostnames in the VPC.</td>
<td>bool</td>
<td>false</td>
<td>No</td>
<td>false</td>
</tr>
<tr>
<td>enable_dns_support</td>
<td> A boolean flag to enable/disable DNS support in the VPC.</td>
<td>bool</td>
<td>true</td>
<td>No</td>
<td>true</td>
</tr>

</table>

## Outputs

<table>
<tr>
    <th>Name</th>
    <th>Description</th>
</tr>
<tr>
<td>vpc_id</td>
<td>The ID of the VPC.</td>
</tr>
<tr>
<td>vpc_cidr_block</td>
<td>The IPv4 CIDR block for the VPC.</td>
</tr>
<tr>
<td>vpc_tags</td>
<td>A map of tags to assign to the resource.</td>
</tr>
<tr>
<td>enable_dns_hostnames</td>
<td> A boolean flag to enable/disable DNS hostnames in the VPC.</td>
</tr>
<tr>
<td>enable_dns_support</td>
<td> A boolean flag to enable/disable DNS support in the VPC.</td>
</tr>
</table>

## Tests

Go initialization (In case test package is not initialized)

```bash
cd test
go mod init tf_aws_vpc_test
go mod edit -require github.com/gruntwork-io/terratest@v0.51.0
go mod tidy
```
## Notes / Known Issues

TBD

## License
MIT