provider "aws" {
  region = "eu-west-3"
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "monitoring-server"]
}

resource "aws_instance" "one" {
  count                  = length(var.instance_names)
  ami                    = "ami-02d7ced41dff52ebc"  # ✅ Ubuntu 22.04 LTS (eu-north-1)
  instance_type          = "t3.micro"
  key_name               = "vkeypair"
  vpc_security_group_ids = ["sg-04b843707185bd55e "]

  tags = {
    Name = var.instance_names[count.index]
  }
}
