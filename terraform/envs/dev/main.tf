provider "aws" {
    region = "us-east-1"
}

module "ec2" {
    source = "../../modules/ec2"

    instance_type   = "t2.micro"
    env             = "dev"
}

output "public_ip" {
  value = module.ec2.public_ip
}