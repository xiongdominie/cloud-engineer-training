terraform {
  backend "s3" {
    bucket         = "dee-terraform-state-20260317"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-locks"
  }
}
