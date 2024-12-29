# Fetch the most recent Ubuntu AMI
data "aws_ami" "amiID" {
    most_recent = true  # Ensure the AMI selected is the most recent

    filter {
        name   = "name"  # Filter by the AMI name
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]  # AMI name pattern for Ubuntu 22.04
    }

    filter {
        name   = "virtualization-type"  # Filter by the virtualization type
        values = ["hvm"]  # Type of virtualization: Hardware Virtual Machine (HVM)
    }

    owners = ["099720109477"]  # Owner ID for Canonical, the publisher of the official Ubuntu AMIs
}

# Output the ID of the fetched AMI
output "instance_id" {
    description = "AMI ID of Ubuntu instance"  # Description of the output variable
    value       = data.aws_ami.amiID.id  # Value to be output, referring to the ID of the fetched AMI
}
