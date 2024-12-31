# Define an AWS EC2 instance resource
resource "aws_instance" "kops" {
    ami = var.amiID[var.region]  # Use the AMI ID fetched based on region from variable
    instance_type = "t3.micro"  # Specify the instance type
    key_name = "kops-key"  # Name of the key pair for SSH access
    vpc_security_group_ids = [aws_security_group.kops-sg.id]  # Attach the instance to the specified security group
    availability_zone = var.zone  # Calling availability zone value from variable

    tags = {
        Name = "kops"  # Tag for instance identification
        Project = "kops"  # Tag for project categorization
    }

    # Provisioner to copy a file to the instance
    provisioner "file" {
        source      = "kops.sh"  # Source file to be copied
        destination = "/tmp/kops.sh"  # Destination path on the instance
    }

    # Connection settings for the provisioner
    connection {
        type        = "ssh"  # Type of connection
        user        = var.webuser  # SSH username from variable
        private_key = file("kopskey")  # Path to the private key file
        host        = self.public_ip  # Use the instance's public IP
    }

    # Provisioner to run remote commands on the instance
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/kops.sh",  # Change permissions to make the script executable
            "sudo /tmp/kops.sh"  # Run the script with sudo
        ]
    }

    # Provisioner to run local commands on the machine where Terraform is being run
    provisioner "local-exec" {
        command = "echo ${self.private_ip} >> private_ips.txt"  # Append the instance's private IP to a file
    }
}

# Define a resource to manage the state of an AWS EC2 instance
resource "aws_ec2_instance_state" "kops-state" {
    instance_id = aws_instance.kops.id  # Reference to the EC2 instance ID
    state       = "running"  # Desired state of the instance (e.g., running)
}

# Output the public IP of the EC2 instance
output "kopsPublicIP" {
    description = "Public IP of the EC2 instance"  # Description of the output variable
    value       = aws_instance.kops.public_ip  # Value to be output, referring to the instance's public IP
}

# Output the private IP of the EC2 instance
output "kopsPrivateIP" {
    description = "Private IP of the EC2 instance"  # Description of the output variable
    value       = aws_instance.kops.private_ip  # Value to be output, referring to the instance's private IP
}
