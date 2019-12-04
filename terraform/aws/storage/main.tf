resource "random_id" "name" {
  byte_length = 2
}


resource "aws_s3_bucket" "logs_bucket" {
  bucket = "timurista-aws-logs-${random_id.name.dec}"
  acl    = "private"

  tags = {
    Name        = "aws s3 bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket" "kops_bucket" {
  bucket        = "k8s-dev0.domain.com-${random_id.name.dec}"
  acl           = "private"
  force_destroy = true
}