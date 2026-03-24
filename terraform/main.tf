provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "allow_ssh" {
    description = "Allow SSH access"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
    ]
    name        = "allow_ssh"
    region      = "us-east-1"
    tags        = {}
    tags_all    = {}
    vpc_id      = "vpc-0256e601c483caf34"
}

resource "aws_security_group" "default" {
    description = "default VPC security group"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 80
        },
        {
            cidr_blocks      = []
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = true
            to_port          = 0
        },
    ]
    name        = "default"
    region      = "us-east-1"
    tags        = {}
    tags_all    = {}
    vpc_id      = "vpc-0256e601c483caf34"
}

resource "aws_instance" "cicd-lab-instance" {
    ami             = "ami-0c02fb55956c7d316"
    instance_type   = "t2.micro"
    key_name = "cicd-key"
    vpc_security_group_ids = [
        aws_security_group.allow_ssh.id,
        aws_security_group.default.id
    ]

    tags = {
        Name = "cicd-lab-instance"
        plan_file_test = "changed to make sure apply will be run"
    }
}

output "public_ip" {
    value = aws_instance.cicd-lab-instance.public_ip
}
