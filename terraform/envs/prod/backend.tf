terraform {
    backend "s3" {
        bucket = "cicd-lab-terraform-state"
        key = "prod/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "terraform-lock"
        encrypt = true
    }
}