# IAM role that App Runner will use, and the roles corresponding trust policy.

resource "aws_iam_role" "role" {
  name = "AWS_AppRunner_Access_Role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "build.apprunner.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

# Attaching the role to the policy 

resource "aws_iam_role_policy_attachment" "attach_role_policy" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}

