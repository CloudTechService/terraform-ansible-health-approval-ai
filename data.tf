data "aws_availability_zones" "available" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy" "SsmRolePolicy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
data "aws_iam_policy" "SsmmanagedCorePolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

data "aws_iam_policy" "DocumentdbPolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonDocDBFullAccess"
}

data "aws_iam_policy_document" "ecsInstanceRolePolicy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

