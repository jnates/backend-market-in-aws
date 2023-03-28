variable "key_pair_name" {
  description = "The name of the key pair to use for the EC2 instance"
  default     = "my_key_pair"
}

variable "aplication_data" {
  description = "User data script for the EC2 instance"
  default     = <<-EOF
                #!/bin/bash
                apt-get update -y
                apt-get install -y golang git busybox
                git clone https://github.com/jnates/back-product-market.git /opt/back-product-market
                export GOPATH=/opt/back-product-market
                go build -o /usr/local/bin/my-api /opt/back-product-market/cmd/api/main.go
                nohup /usr/local/bin/my-api &
                echo "Test api market terraform Server" > /var/www/html/index.html
                nohup busybox httpd -f -p 8080 -h /var/www/html &
                EOF
}

variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "eu-west-1"
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
  default     = "ami-00169914e6299b8e0"
}