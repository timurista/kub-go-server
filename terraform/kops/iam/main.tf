resource "aws_iam_user" "kops_user" {
  name = "kops_user"
  force_destroy = true
}

resource "aws_iam_access_key" "kops_user" {
  user = "${aws_iam_user.kops_user.name}"
}

resource "aws_iam_policy_attachment" "fullaccess" {
  name       = "test-attachment"
  users      = ["${aws_iam_user.kops_user.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_policy_attachment" "routefullaccess" {
  name       = "test-attachment"
  users      = ["${aws_iam_user.kops_user.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

resource "aws_iam_policy_attachment" "s3fullaccess" {
  name       = "test-attachment"
  users      = ["${aws_iam_user.kops_user.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_policy_attachment" "iamfullaccess" {
  name       = "test-attachment"
  users      = ["${aws_iam_user.kops_user.name}"]
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_policy_attachment" "vpcfullaccess" {
  name       = "test-attachment"
  users      = ["${aws_iam_user.kops_user.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}


output "access_id" {
  value = "${aws_iam_access_key.kops_user.id}"
}

output "secret" {
  value = "${aws_iam_access_key.kops_user.secret}"
}
