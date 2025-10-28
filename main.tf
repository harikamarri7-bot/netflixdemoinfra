provider "aws" {
  region = "eu-north-1"
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "monitoring-server"]
}

resource "aws_instance" "one" {
  count                  = length(var.instance_names)
  ami                    = "ami-0d7b19f580b1d7cc4"  # Ubuntu 22.04 LTS - eu-north-1
  instance_type          = "t3.micro"
  key_name               = "jenkins"
  vpc_security_group_ids = ["sg-07497a48ddb5a2d1f"]

  tags = {
    Name = var.instance_names[count.index]
  }
}
