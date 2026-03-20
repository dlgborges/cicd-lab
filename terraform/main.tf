provider "aws" {
    region = "us-east-1"

    assume_role {
    role_arn = "arn:aws:iam::542525596293:role/terraform-execution-role"
  }
}

resource "aws_security_group" "ssh" {
    name = "allow_ssh"
    description = "Allow SSH access"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

#resource "aws_key_pair" "deployer" {
#    key_name = "cicd-key"
#    public_key = file("id_ed25519.pub") 
#}

resource "aws_instance" "example" {
    ami             = "ami-0c02fb55956c7d316"
    instance_type   = "t2.micro"
    key_name = aws_key_pair.deployer.key_name
    vpc_security_group_ids = [aws_security_group.ssh.id]

    tags = {
        Name = "cicd-lab-instance"
    }
}

output "public_ip" {
    value = aws_instance.example.public_ip
}
