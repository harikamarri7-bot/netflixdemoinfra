provider "aws" {
  region = "eu-north-1"
}

variable "instance_names" {
  type    = list(string)
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}

resource "aws_instance" "one" {
  count                  = length(var.instance_names)
  ami                    = "ami-01fd6fa49060e89a6"
  instance_type          = "t3.micro"
  key_name               = "vkeypair"
  vpc_security_group_ids = ["sg-09cdaab8b5f8a0a95"]

  tags = {
    Name = var.instance_names[count.index]
  }
}
