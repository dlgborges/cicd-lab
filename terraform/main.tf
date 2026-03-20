provider "aws" {
    region = "us-east-1"

    assume_role {
    role_arn = "arn:aws:iam::542525596293:role/terraform-execution-role"
  }
}

resource "aws_instance" "example" {
    ami             = "ami-0c02fb55956c7d316"
    instance_type   = "t2.micro"
    key_name = "cicd-key"
    vpc_security_group_ids = ["allow_ssh"]

    tags = {
        Name = "cicd-lab-instance"
    }
}

output "public_ip" {
    value = aws_instance.example.public_ip
}
