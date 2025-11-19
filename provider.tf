terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.21.0"
    }
  }
  backend "s3" {
    bucket = "brian-boa-terraform-state"
    key = "dev/brian/terraform.tfstate"
    encrypt = true
    region = "us-east-1"
    dynamodb_table = "brian-local-table"
    
  }
}

provider "aws" {
  # Configuration options
  region = var.my-region
}
