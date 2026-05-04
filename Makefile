.PHONY: fmt-check validate tflint docs-check static-check terratest test

# Only validate examples that are expected to produce valid configurations.
# examples/not_valid_* are intentionally invalid and exercised exclusively by Terratest.
VALIDATE_DIRS := examples/complete

fmt-check:
	@echo "==> Running terraform fmt check..."
	terraform fmt -check -recursive

validate:
	@echo "==> Validating root module..."
	terraform init -backend=false
	terraform validate
	@for dir in $(VALIDATE_DIRS); do \
		echo "==> Validating $$dir..."; \
		(cd $$dir && terraform init -backend=false && terraform validate); \
	done

tflint:
	@echo "==> Running tflint..."
	tflint --init
	tflint --recursive

docs-check:
	@echo "==> Checking terraform-docs..."
	terraform-docs --output-check .

static-check: fmt-check validate tflint docs-check

terratest:
	@echo "==> Running Terratest..."
	cd test && go test -v -timeout 30m ./...

test: static-check terratest
