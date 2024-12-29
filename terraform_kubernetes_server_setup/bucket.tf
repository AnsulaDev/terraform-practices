
resource "aws_s3_bucket" "kopsansula" {
    bucket = "kopsansula"  # The name of the S3 bucket
    tags = {
        Name        = "kopsansula"
        Environment = "kopsansula"
    }
}

output "s3_bucket_name" {
    value = aws_s3_bucket.kopsansula.bucket
}
