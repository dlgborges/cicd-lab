provider "aws" {
    region = "us-east-1"

    assume_role {
    role_arn = "arn:aws:iam::542525596293:role/terraform-execution-role"
  }
}

resource "aws_instance" "example" {
    ami             = "ami-0c02fb55956c7d316"
    instance_type   = "t2.micro"

    tags = {
        Name = "cicd-lab-instance"
    }
}
