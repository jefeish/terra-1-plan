# ##############################################################################
# This module only creates an UUID for use as a tag
# The stack_id must be lower case to be compliant with certain AWS restictions.
#
# Why do we need a "stack_id" ?
# This helps to clearly identify all dependent AWS resources for a specific 
# Terraform stack. 
#
# This is especially important for two reasons:
# 1. Running the Terraform stack (repeatedly) using the same .tfvars file 
#    (not using existing Terraform plan). This will pretty much try to create 
#    identical components (name tags etc), which can be confusing. The unique ID
#    will clearly identify all artifacts.
# 2. We "lost" the Terraform plan and need to manually identify dependent
#    modules, and clean them up if needed.
#
# It's just a good practice!
# ##############################################################################
variable region {
  type = string
}

provider "aws" {
  region = var.region
}

resource "random_id" "stack_id" {
  byte_length = 2
}

output "stack_id" {
  value = "${lower("${random_id.stack_id.hex}")}"
}
