provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0c398cb65a93047f2"
  instance_type          = "t2.micro"
  key_name               = "jenkins"
  vpc_security_group_ids = ["sg-0b646936fb0ea432f"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
