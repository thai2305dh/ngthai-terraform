provider "aws" {
  region     = "us-east-2"
  access_key = "****"
  secret_key = "****"
}

resource "aws_instance" "ubuntu-server" {
    ami         = "ami-0fb653ca2d3203ac1"
    instance_type = "t2.micro"
}