provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

locals {
  web_instance_type_map = {
    stage = "t3.micro"
    prod = "t3.large"
  }
  web_instance_count_map = {
    stage = 1
    prod = 2
  }
  instances = {
    "t3.micro" = data.aws_ami.ubuntu.id
    "t3.large" = data.aws_ami.ubuntu.id
  }
}

resource "aws_instance" "web" {
  ami = data.aws_ami.ubuntu.id
  instance_type = local.web_instance_type_map[terraform.workspace]
  count = local.web_instance_count_map[terraform.workspace]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "web_for_each" {
  for_each = local.instances

  instance_type = each.key
  ami = each.value
}

resource "aws_instance" "web_for_each" {
  for_each = local.instances

  instance_type = each.key
  ami = each.value
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "web_by_module"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
}