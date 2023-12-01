provider "aws" {
  region = var.region
  # profile = "ballo"
}

# terraform {
#   backend "s3" {
#     bucket = "terraform-s3-backend-aws12"
#     key    = "path/to/my/key"
#     region = "us-east-2"
#   }
# }