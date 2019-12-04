resource "random_id" "name" {
  byte_length = 2
}

resource "aws_s3_bucket" "kops_bucket" {
  bucket        = "timurista-k8s-dev0.domain.com-${random_id.name.dec}"
  acl           = "private"
  force_destroy = true
}

output "kops_bucket" {
  value = "${aws_s3_bucket.kops_bucket.bucket}"
}
