provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0a68bfeb2d7b29d39"
  instance_type          = "t3.medium"
  key_name               = "jenkins"
  vpc_security_group_ids = ["sg-07497a48ddb5a2d1f"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
