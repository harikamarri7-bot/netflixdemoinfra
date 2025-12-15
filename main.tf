provider "aws" {
  region = "us-east-1"
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "monitoring-server"]
}

resource "aws_instance" "one" {
  count                  = length(var.instance_names)
  ami                    = "ami-005b1eaf15c2e3e20"  # ✅ Ubuntu 22.04 LTS (eu-north-1)
  instance_type          = "t3.medium"
  key_name               = "slave1"
  vpc_security_group_ids = ["sg-07497a48ddb5a2d1f"]

  tags = {
    Name = var.instance_names[count.index]
  }
}
