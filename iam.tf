resource "aws_iam_role" "ecsInstanceRole" {
  name               = "ecsInstanceRole"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.ecsInstanceRolePolicy.json
}


resource "aws_iam_role_policy_attachment" "ecsInstancePolicy2" {
  role       = aws_iam_role.ecsInstanceRole.name
  policy_arn = data.aws_iam_policy.SsmRolePolicy.arn

}
resource "aws_iam_role_policy_attachment" "ecsInstancePolicy3" {
  role       = aws_iam_role.ecsInstanceRole.name
  policy_arn = data.aws_iam_policy.SsmmanagedCorePolicy.arn

}

resource "aws_iam_role_policy_attachment" "ecsInstancePolicy4" {
  role       = aws_iam_role.ecsInstanceRole.name
  policy_arn = data.aws_iam_policy.DocumentdbPolicy.arn

}

resource "aws_iam_instance_profile" "ecsInstanceRoleProfile" {
  name = aws_iam_role.ecsInstanceRole.name
  role = aws_iam_role.ecsInstanceRole.name
}