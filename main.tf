provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0a716d3f3b16d290c"
  instance_type          = "t2.medium"
  key_name               = "Netflix"
  vpc_security_group_ids = ["sg-07497a48ddb5a2d1f"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
