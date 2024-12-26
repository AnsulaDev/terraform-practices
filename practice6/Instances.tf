# Define an AWS EC2 instance resource
resource "aws_instance" "web" {
    ami = var.amiID[var.region]  # Use the AMI ID fetched based on region from variable
    instance_type = "t3.micro"  # Specify the instance type
    key_name = "dove-key"  # Name of the key pair for SSH access
    vpc_security_group_ids = [aws_security_group.dove-sg.id]  # Attach the instance to the specified security group
    availability_zone = var.zone  # Calling availability zone value from variable

    tags = {
        Name = "Dove-web"  # Tag for instance identification
        Project = "Dove"  # Tag for project categorization
    }

    # Provisioner to copy a file to the instance
    provisioner "file" {
        source      = "web.sh"  # Source file to be copied
        destination = "/tmp/web.sh"  # Destination path on the instance
    }

    # Connection settings for the provisioner
    connection {
        type        = "ssh"  # Type of connection
        user        = var.webuser  # SSH username from variable
        private_key = file("dovekey")  # Path to the private key file
        host        = self.public_ip  # Use the instance's public IP
    }

    # Provisioner to run remote commands on the instance
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/web.sh",  # Change permissions to make the script executable
            "sudo /tmp/web.sh"  # Run the script with sudo
        ]
    }

    # Provisioner to run local commands on the machine where Terraform is being run
    provisioner "local-exec" {
        command = "echo ${self.private_ip} >> private_ips.txt"  # Append the instance's private IP to a file
    }
}

# Define a resource to manage the state of an AWS EC2 instance
resource "aws_ec2_instance_state" "web-state" {
    instance_id = aws_instance.web.id  # Reference to the EC2 instance ID
    state       = "running"  # Desired state of the instance (e.g., running)
}

# Output the public IP of the EC2 instance
output "webPublicIP" {
    description = "Public IP of the EC2 instance"  # Description of the output variable
    value       = aws_instance.web.public_ip  # Value to be output, referring to the instance's public IP
}

# Output the private IP of the EC2 instance
output "webPrivateIP" {
    description = "Private IP of the EC2 instance"  # Description of the output variable
    value       = aws_instance.web.private_ip  # Value to be output, referring to the instance's private IP
}
