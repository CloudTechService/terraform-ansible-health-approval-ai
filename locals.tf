locals {
  common_tags = {}

  vpc = {
    name_vpc = "${var.env}-vpc-health-ai"
    vpc_cidr = "10.0.0.0/16"
    azs      = slice(data.aws_availability_zones.available.names, 0, 3)
  }
}