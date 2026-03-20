provider "aws" {
    region = "us-east-1"

    assume_role {
    role_arn = "arn:aws:iam::542525596293:role/terraform-execution-role"
  }
}

resource "aws_instance" "example" {
    ami             = "ami-0c02fb55956c7d316"
    instance_type   = "t2.micro"
    key_name = aws_key_pair.deployer.key_name

    tags = {
        Name = "cicd-lab-instance"
    }
}

resource "aws_key_pair" "deployer" {
    key_name = "cicd-key"
    public_key = file("id_ed25519.pub") 
}
