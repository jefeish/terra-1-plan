# terra-1-plan

Note: Run every command from within the `terra-1-plan` repo.

- Initialize

```
terraform init
```

- Verify that the `Plan` is valid

```
terraform validate
```

- Check what changes would be applied

```
terraform plan -var-file=../terra-1-vars/environment/<alpha|beta|prod>/terraform.tfvars -state=../terra-1-state/environment/<alpha|beta|prod>/terraform.tfstate
```

- Apply the plan with its variables

```
terraform apply -var-file=../terra-1-vars/environment/<alpha|beta|prod>/terraform.tfvars -state=../terra-1-state/environment/<alpha|beta|prod>/terraform.tfstate
```
