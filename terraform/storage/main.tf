resource "random_id" "name" {
  byte_length = 2
}


resource "aws_s3_bucket" "logs-bucket" {
  bucket = "timurista-aws-logs-${random_id.name.hex}"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "dev"
  }
}