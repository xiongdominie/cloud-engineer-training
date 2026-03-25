
terraform {
  backend "s3" {
    bucket         = "dee-terraform-state-20260317"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}