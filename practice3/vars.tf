# Define a variable for the AWS region
variable "region" {
    default = "us-east-1"  # Default value for the region variable
}

# Define a variable for the AWS availability zone within the region
variable "zone" {
    default = "us-east-1a"  # Default value for the availability zone variable
}

# Define a variable for AMI IDs mapped by region
variable "amiID" {
    type = map  # Specify the variable type as a map
    default = {  # Default values for the AMI IDs mapped by region
        us-east-1 = "ami-0e2c8caa4b6378d8c"  # AMI ID for us-east-1 region
        us-east-2 = "ami-036841078a4b68e14"  # AMI ID for us-east-2 region
    }
}
