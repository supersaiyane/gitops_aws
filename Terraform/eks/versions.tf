# Terraform Settings Block
terraform {
#   required_version = ">= 1.0.0"
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "~> 4.12"
#      }
#   }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-state-stage"
    key    = "stage/eks-cluster/terraform.tfstate"
    region = "us-east-2" 
 
    # For State Locking
    dynamodb_table = "stage-ekscluster"    
  }  
}

# Terraform Provider Block
provider "aws" {
  region = var.aws_region
}