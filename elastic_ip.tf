resource "aws_eip_association" "elastic_ip" {
    instance_id     = "${aws_instance.web.id}"
    allocation_id   = "${aws_eip.web_ip.id}"
}

resource "aws_eip" "web_ip" {
    vpc             = true
}


output "ip" {
    value           = "${aws_eip_association.elastic_ip.public_ip}"
}
