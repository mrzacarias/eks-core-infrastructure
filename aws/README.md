# AWS Terraform Specs

Repository of Terraform specs to setup AWS resources

## Install/Update resources
```
terraform apply
```

This will create:
 - A single VPC, to be used by the EKS cluster
 - Two security groups, attached to the cluster control plane
 - The EKS Cluster, running on 2 node groups (1x t3a.medium each, up to 3x)

## Delete resources
```
terraform destroy
```

### Note
If a `DependencyViolation` happens, check if all resources created outside this terraform spec were deleted. (e.g. LoadBalancers and SGs)
