# Define an AWS EC2 instance resource
resource "aws_instance" "web" {
    ami =  var.amiID[var.region] # Use the AMI ID fetched based on region from variable
    instance_type = "t3.micro"  # Specify the instance type
    key_name = "dove-key"  # Name of the key pair for SSH access
    vpc_security_group_ids = [aws_security_group.dove-sg.id]  # Attach the instance to the specified security group
    availability_zone = var.zone # calling availability zone value from variable

    tags = {
        Name = "Dove-web"  # Tag for instance identification
        Project = "Dove"  # Tag for project categorization
    }
    provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
    }

    connection {
    type     = "ssh"
    user     = var.webuser
    private_key = file("dovekey")
    host     = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/web.sh",
            "sudo /tmp/web.sh"
        ]
    }

}


# Define a resource to manage the state of an AWS EC2 instance
resource "aws_ec2_instance_state" "web-state" {
    instance_id = aws_instance.web.id  # Reference to the EC2 instance ID
    state       = "running"  # Desired state of the instance (e.g., running)
}
