terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-ami-1234567890abcdef0"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
