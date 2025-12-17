provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-01b9f1e7dc427266e"
  instance_type          = "t3.medium"
  key_name               = "jenkins"
  vpc_security_group_ids = ["sg-0b646936fb0ea432f"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
