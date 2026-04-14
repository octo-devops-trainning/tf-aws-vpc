package tf_aws_vpc_test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformCreateVpcOk(t *testing.T) {
	// run first this test to make parallel test get in pause
	// so a set up could be done by the first run of the terraform init and
	// parallel test can reuse it
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/complete",
		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	})

	// Clean up resources at the end of the test
	defer terraform.Destroy(t, terraformOptions)

	// Run 'terraform init' and 'terraform apply'
	terraform.InitAndApply(t, terraformOptions)

	// Run 'terraform output' to get the value of an output variable
	outputValueCidr := terraform.Output(t, terraformOptions, "vpc_cidr_block")
	outputValueTags := terraform.OutputMap(t, terraformOptions, "vpc_tags")
	// Verify the output matches expectation
	assert.Equal(t, "10.0.0.0/16", outputValueCidr)
	assert.Equal(t, "Complete VPC", outputValueTags["Name"])
}

func TestTerrraformNotValidCidr(t *testing.T) {
	t.Parallel()
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/not_valid_cidr",
		NoColor:      true,
	})
	if _, err := terraform.InitAndPlanE(t, terraformOptions); err != nil {
		errMessage := err.Error()
		assert.Contains(t, errMessage, "Must be a valid IPv4 CIDR block (e.g, 10.0.0.0/16)")
	}
}

func TestTerrraformNotValidTags(t *testing.T) {
	t.Parallel()
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/not_valid_tags",
		NoColor:      true,
	})
	if _, err := terraform.InitAndPlanE(t, terraformOptions); err != nil {
		errMessage := err.Error()
		assert.Contains(t, errMessage, "\"Environment\" and \"Name\" are")
	}
}
