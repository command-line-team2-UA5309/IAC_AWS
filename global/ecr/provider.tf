terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }

  backend "s3" {
    bucket       = "cli-team-terraform-state"
    key          = "global/ecr/terraform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
  }
}

provider "aws" {
  region = "eu-central-1"
}
