 provider "aws" {
  version = "2.33.0"
  region = "us-east-2"
}

resource "aws_iam_user" "Sujay" {
  name = "Sujay"


  tags = {
    tag-key = "Ter-1"
  }
}

resource "aws_iam_access_key" "Sujay" {
  user = aws_iam_user.Sujay.name
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.Sujay.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}
