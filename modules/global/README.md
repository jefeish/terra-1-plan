# Module - global

## Description

This module only creates an UUID for use as a tag

The stack_id must be lower case to be compliant with certain AWS restictions.

## Notes

---
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_id.stack_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | ############################################################################## This module only creates an UUID for use as a tag The stack\_id must be lower case to be compliant with certain AWS restictions.  Why do we need a "stack\_id" ? This helps to clearly identify all dependent AWS resources for a specific Terraform stack.  This is especially important for two reasons: 1. Running the Terraform stack (repeatedly) using the same .tfvars file (not using existing Terraform plan). This will pretty much try to create identical components (name tags etc), which can be confusing. The unique ID will clearly identify all artifacts. 2. We "lost" the Terraform plan and need to manually identify dependent modules, and clean them up if needed.  It's just a good practice! ############################################################################## | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_stack_id"></a> [stack\_id](#output\_stack\_id) | n/a |
