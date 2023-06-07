resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  tags = {
    "Name" = "Great Bucket"
  }
}

data "template_file" "bucket_policy" {
  template = file("${path.module}/bucket_policy.json")

  vars = {
    bucket_name = var.bucket_name
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.template_file.bucket_policy.rendered
}



