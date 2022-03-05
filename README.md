### What is this repository for? ###

This repository holds the Terraform code required to deploy resources on a AWS account.

Prerequisites:

1 - Create a key-pair and add the name to the worker variable.

2 - run terrafrom apply once, then get the ebs/kms key and use the id on the EKS module

3 - On the first run, the helm-eks-plugin will show an error as there is no kubeconfig to identify the cluster. Get the kubeconfig file from the terraform output and copy it into the account folder (aws-stage) in a file named " .kubeconfig ". Then run " terraform apply " again.
