# GitOps with ArgoCD and K8s on AWS

## Components Involved
* AWS
  * CodeCommit
  * CodeBuild
  * CodePipeline
  * EKS
  * ECR
* ArgoCD
* Terraform
  * initialize_remote_state
  * vpc_bastion
  * eks
  * LB_Cloudwatch 

## Architecture 
![GitOps Architecture](https://github.com/supersaiyane/gitops_aws/blob/main/Architecture_gitops%20with%20argocd%20and%20aws.webp)

### Workflow of the Architecture
* First, our Terraform code will create the complete infrastructure, which includes VPC, Subnets, Security Groups (SG), Route Tables, Internet Gateway, NAT Gateway, Kubernetes, ALB Controller, required policies for K8s to function, and CloudWatch logs for K8s.
* Install ArgoCD and retrieve the password.
* Create a repository for code and service deployments in CodeCommit.
* Build the project using CodeBuild and create a Buildspec file to generate a Docker image and update the YAML version of the deployments.
* Create a CodePipeline for pipeline automation.
* Authenticate the CodeCommit Ops repository with ArgoCD.
* Create a project for the service in ArgoCD.
* Once a user commits code to the branch, CodePipeline will trigger. It will create a new Docker image, push it to ECR, and then update the deployment YAML files with the latest Docker image version.
* As soon as the image version is updated, ArgoCD will detect the change and deploy the latest version of the service in Kubernetes (K8s).

## Complete Article Series 

* [Simplifying Kubernetes Operations with Terraform, ArgoCD and GitOps on AWS: Part 1](https://medium.com/@gurpreet.singh_89/simplifying-kubernetes-operations-with-argocd-and-gitops-part-1-f015354feba5)
* [Simplifying Kubernetes Operations with Terraform, ArgoCD and GitOps on AWS: Part 2](https://medium.com/@gurpreet.singh_89/simplifying-kubernetes-operations-with-argocd-and-gitops-on-aws-part-2-a994e8d1292d)
* [Simplifying Kubernetes Operations with Terraform, ArgoCD and GitOps on AWS: Part 3](https://medium.com/@gurpreet.singh_89/simplifying-kubernetes-operations-with-terraform-argocd-and-gitops-on-aws-part-3-6d4fb71484d3)
* [Simplifying Kubernetes Operations with Terraform, ArgoCD and GitOps on AWS: Part 4]
  
