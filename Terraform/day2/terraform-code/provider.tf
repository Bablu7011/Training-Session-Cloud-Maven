terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }


  #   backend "s3" {
  #     bucket         = "first-my-s3-bucket70111"
  #     dynamodb_table = "my-first-dynamo-table"
  #     region         = "ap-south-1"
  #     key            = "terraform.state"
  #   }

}


provider "aws" {
  region = "ap-south-1"
}


