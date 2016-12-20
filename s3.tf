variable "s3-bucket" {
    description = "S3 Bucket"
}

variable "s3-key_dir" {
    description = "Path to S3 key 'directory'"
}

variable "physical_res" {
    description = "Resource to be sync to S3"
}


resource "aws_s3_bucket_object" "object" {
    bucket      = "${var.s3-bucket}"
    key         = "${var.s3-key_dir}/${var.physical_res}"
    source      = "${var.physical_res}"
    etag        = "${md5(file("${var.physical_res}"))}"
}


output "s3_key" {
    value       = "${aws_s3_bucket_object.object.id}"
}
