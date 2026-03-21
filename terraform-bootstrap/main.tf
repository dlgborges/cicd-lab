provider "aws" {
    region = "us-east-1"

    assume_role {
    role_arn = "arn:aws:iam::542525596293:role/terraform-execution-role"
  }
}

resource "aws_s3_bucket" "tf_state" {
    bucket = "cicd-lab-terraform-state"

    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.tf_state.id

    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_dynamodb_table" "tf_lock" {
    name = "terraform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}