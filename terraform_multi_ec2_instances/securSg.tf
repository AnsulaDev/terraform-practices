resource "aws_security_group" "dove-sg" {
        name = "dove-sg"
        description = "dove-sg"

        tags = {
            name = "dove-sg"
        }
}


resource "aws_vpc_security_group_ingress_rule" "sshMyIPadd" {
    security_group_id = aws_security_group.dove-sg.id
    cidr_ipv4 = "49.37.108.25/24"
    from_port = "22"
    ip_protocol = "tcp"
    to_port = "22"

}

resource "aws_vpc_security_group_ingress_rule" "sshMyIPadd" {
    security_group_id = aws_security_group.dove-sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = "80"
    ip_protocol = "tcp"
    to_port = "80"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
    security_group_id = aws_security_group.dove-sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"

}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
    security_group_id = aws_security_group.dove-sg.id
    cidr_ipv4 = "::/0"
    ip_protocol = "-1"

}