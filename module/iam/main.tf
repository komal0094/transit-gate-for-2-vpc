//creating iam role
resource "aws_iam_role" "s3_role" {
  name = "s3_full_access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

//iam policy
resource "aws_iam_policy" "s3_policy" {
  name = "s3_test_policy"
  # role = aws_iam_role.s3_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17",
    "Statement" : [
      {
        "Effect": "Allow",
        "Action": [
          "s3:*",
          "s3-object-lambda:*"
        ],
        "Resource": "*"
      }
    ]
  })
}



//policy attach to role
resource "aws_iam_policy_attachment" "policy-attach" {
  name       = "test-attachment"
  roles      = [aws_iam_role.s3_role.name]
  policy_arn = aws_iam_policy.s3_policy.arn
}

//iam instance profile
resource "aws_iam_instance_profile" "instance_profile" {
  name = "s3_instance_profile"
  role = aws_iam_role.s3_role.name
}