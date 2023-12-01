resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "terraform-fstate-s3-bucket-me"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "example" {
  name             = "terraform-dynamodb-lock"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

}

terraform {
  backend "s3" {
    bucket = "terraform-fstate-s3-bucket-me"
    key    = "dev/terraform.fstate"
    region = "us-west-1"
    dynamodb_table = "terraform-dynamodb-lock"
    encrypt = true
  }
}

