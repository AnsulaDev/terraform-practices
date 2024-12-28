resource "aws_instance" "web" {
    ami =var.amiID[var.region]
    instance_type = "t3.micro"
    key_name ="dovekey"
    vpc_security_group_ids = [aws_security_group.dove-sg.id]
    availability_zone = var.zone1

    tags = {
        name: "dove-web"
        project: "dove"
    }
}

resource "aws_instance" "database" {
    ami =var.amiID[var.region]
    instance_type = "t3.micro"
    key_name ="dovekey"
    vpc_security_group_ids = [aws_security_group.dove-sg.id]
    availability_zone = var.zone1

    tags = {
        name: "dove-web"
        project: "dove"
    }
}


resource "aws_ec2_instance_state" "web-state" {
    instance_id = aws_instance.web.id
    state = "running"
}

resource "aws_ec2_instance_state" "database-state" {
    instance_id = aws_instance.database.id
    state = "running"
}