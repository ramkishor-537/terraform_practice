terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0" # Terraform AWS provider version
    }
  }

# when the below code is provided terraform decide that terraaform state file should not store locally
# but it should store in remote s3 
  backend "s3" {
    bucket  = "remote-state-aws-88s" # Replace with your unique bucket name
    key     = "remote-state.tfstate"
    region  = "us-east-1"
    encrypt = true
    use_lockfile   = true # native locking provided by terraform, no dynamo db table is not required
  }
}

provider "aws" {
  region = "us-east-1"
}