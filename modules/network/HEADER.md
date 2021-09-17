# Module: ghes-subnets

## Description

This module creates Public and Private subnets (always both) in an AWS Availibility zone.

### Note

This modules does not use the Terraform function `cidrsubnets`, since it does not check for the availability of the requested subnet CIDRs

---
