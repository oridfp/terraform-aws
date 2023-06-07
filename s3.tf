resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  tags = {
    "Name" = "Great Bucket"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = <<EOF
{
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "AllowCloudFrontServicePrincipal",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::40n-terraform-bucket/*",
            "Condition": {
                "StringEquals": {
                    "AWS:SourceArn": "arn:aws:cloudfront::951963022987:distribution/E28A4517S9X8EZ"
                }
            }
        }
    ]
}
EOF
}





