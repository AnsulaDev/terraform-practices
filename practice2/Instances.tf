# Define an AWS EC2 instance resource
resource "aws_instance" "web" {
    ami = data.aws_ami.amiID.id  # Use the AMI ID fetched from the data source
    instance_type = "t3.micro"  # Specify the instance type
    key_name = "dove-key"  # Name of the key pair for SSH access
    vpc_security_group_ids = [aws_security_group.dove-sg.id]  # Attach the instance to the specified security group
    availability_zone = "us-east-1a"  # Specify the availability zone

    tags = {
        Name = "Dove-web"  # Tag for instance identification
        Project = "Dove"  # Tag for project categorization
    }
}
