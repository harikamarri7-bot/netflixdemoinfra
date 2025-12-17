provider "aws" {
  region = "us-east-1"
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "monitoring-server"]
}

resource "aws_instance" "two" {
  count                  = length(var.instance_names)
  ami                    = "ami-00839c71d8f6096b4"  # ✅ Ubuntu 22.04 LTS (eu-north-1)
  instance_type          = "t3.medium"
  key_name               = "jenkins"
  vpc_security_group_ids = ["sg-0b646936fb0ea432f"]

  tags = {
    Name = var.instance_names[count.index]
  }
}
