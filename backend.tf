# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket  = "test-fira"
    encrypt = true
    key     = "terragrunt/dev/terraform.tfstate"
    region  = "us-east-1"
  }
}
