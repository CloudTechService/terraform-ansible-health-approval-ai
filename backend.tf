terraform {
  backend "s3" {
    bucket         = "terraform-tfstate-ai-cloud-health-prod"
    key            = "state/terraform-health-ai-prod-state.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "ai-terraform-backend"
  }
}