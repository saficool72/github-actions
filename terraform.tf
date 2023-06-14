/*
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider.
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "new-vpc2" {
cidr_block = "10.0.0.0/16"
}
*/
