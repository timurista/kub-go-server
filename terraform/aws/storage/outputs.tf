output "logs_bucket" {
  value = "${aws_s3_bucket.logs_bucket}"
}

output "kops_bucket" {
  value = "${aws_s3_bucket.kops_bucket}"
}
