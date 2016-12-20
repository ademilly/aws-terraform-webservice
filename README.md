# aws-terraform-webservice
Simple terraform module for ec2 (server) + eip (public ip) + s3 (deploy resources) infrastructure

## usage

```
module "some-service" {
    source = "github.com/ademilly/aws-terraform-webservice"

    name            = "my-webservice"
    instance_type   = "t2.micro"

    key_name        = "my-ec2-key"
    user_data       = "path-to-setup.sh"
    service_port    = "8000"

    s3-bucket       = "mybucket-deploy-resource"
    s3-key          = "some/key/to/something"
    physical_res    = "some/local/resource"
}
```
