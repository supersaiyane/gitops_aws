# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.14"
     }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.11"
    }    
    http = {
      source = "hashicorp/http"
      version = "~> 2.1"
    }     
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }     
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-state-pf3-stage"
    key    = "stage/eks-cloudwatch-lb/terraform.tfstate"
    region = "us-east-2" 

    # For State Locking
    dynamodb_table = "stage-eks-cloudwatch-lb"    
  }     
}

