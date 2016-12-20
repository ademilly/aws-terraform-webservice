variable "name" {
    description             = "Infrastructure name"
}

variable "instance_type" {
    description             = "Instance type"
}

variable "key_name" {
    description             = "EC2 Key name"
}

variable "user_data" {
    description             = "Launch script"
}

variable "service_port" {
    description             = "Port to open"
}


resource "aws_instance" "web" {
    ami                     = "ami-d41d58a7"
    instance_type           = "${var.instance_type}"
    key_name                = "${var.key_name}"
    vpc_security_group_ids  = ["${aws_security_group.web_security.id}"]

    iam_instance_profile    = "dev-machines"

    tags {
        Name                = "${var.name}"
    }

    user_data               = "${var.user_data}"
}

resource "aws_security_group" "web_security" {
    name                    = "${var.name}-security-group"

    ingress {
        from_port           = "${var.service_port}"
        to_port             = "${var.service_port}"
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
    }

    ingress {
        from_port           = 22
        to_port             = 22
        protocol            = "tcp"
        cidr_blocks         = ["0.0.0.0/0"]
    }

    egress {
        from_port           = 0
        to_port             = 0
        protocol            = "-1"
        cidr_blocks         = ["0.0.0.0/0"]
    }
}
