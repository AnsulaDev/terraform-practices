# Configure the backend to use Amazon S3 for storing the Terraform state
terraform {
    backend "s3" {
        bucket = "your bucket name"  # The name of the S3 bucket where the state file will be stored
        key    = "your bucket folder"  # The path within the bucket to store the state file
        region = "us-east-1"  # The AWS region where the S3 bucket is located
    }
}
