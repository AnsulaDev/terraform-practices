// Define the security group
resource "aws_security_group" "dove-sg" {
    name        = "dove-sg"  # Name of the security group
    description = "dove-sg"  # Description of the security group

    tags = {
        Name = "dove-sg"  # Tag for identifying the security group
    }
}

// Define inbound rule to allow SSH access from a specific IP
resource "aws_vpc_security_group_ingress_rule" "sshFromMyIP" {
    security_group_id = aws_security_group.dove-sg.id  # Reference to the security group
    cidr_ipv4         = "your ip address "  # CIDR block to allow SSH access from a specific IP
    from_port         = 22  # Starting port for SSH
    ip_protocol       = "tcp"  # Protocol type
    to_port           = 22  # Ending port for SSH
}

// Define inbound rule to allow HTTP access from anywhere
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
    security_group_id = aws_security_group.dove-sg.id  # Reference to the security group
    cidr_ipv4         = "0.0.0.0/0"  # CIDR block to allow HTTP access from any IP
    from_port         = 80  # Starting port for HTTP
    ip_protocol       = "tcp"  # Protocol type
    to_port           = 80  # Ending port for HTTP
}

// Define outbound rule to allow all traffic for IPv4
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
    security_group_id = aws_security_group.dove-sg.id  # Reference to the security group
    cidr_ipv4         = "0.0.0.0/0"  # CIDR block to allow all outbound IPv4 traffic
    ip_protocol       = "-1"  # Protocol type set to all (equivalent to all ports)
}

// Define outbound rule to allow all traffic for IPv6
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
    security_group_id = aws_security_group.dove-sg.id  # Reference to the security group
    cidr_ipv6         = "::/0"  # CIDR block to allow all outbound IPv6 traffic
    ip_protocol       = "-1"  # Protocol type set to all (equivalent to all ports)
}
