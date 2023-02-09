resource "aws_elb" "web-lb" {
  name               = "web-lb"
  security_groups    = [aws_security_group.web-lb.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  instances = [aws_instance.web-app.*.id]
}

resource "aws_instance" "web-app" {
  count = var.web_app_instance_count

  ami           = var.ami
  instance_type = var.web_app_instance_type
}

resource "aws_s3_bucket" "dynamic-data" {
bucket = "dynamic-data"
}

resource "aws_rds_instance" "postgres" {
identifier = "postgres"

}

resource "aws_security_group" "web-lb" {
name = "web-lb"
description = "Security group for the web load balancer"

ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

}

/* Docker image build and push */
resource "null_resource" "docker_build" {
provisioner "local-exec" {
command = "docker build -t app_image:latest ."
}
}

resource "null_resource" "docker_push" {
provisioner "local-exec" {
command = "docker push app_image:latest"
}
}

#Deployment using AWS CodeDeploy
resource "aws_codedeploy_app" "web-app" {
name = "web-app"
}

resource "aws_codedeploy_deployment_group" "web-app" {
app_name = aws_codedeploy_app.web-app.name
deployment_group_name = "web-app-dep-group"

}

#Monitoring and Logging using AWS CloudWatch
resource "aws_cloudwatch_log_group" "web-app-logs" {
name = "web-app-logs"
}

resource "aws_cloudwatch_log_stream" "web-app-logs" {
name = "web-app-logs"
log_group_name = aws_cloudwatch_log_group.web-app-logs.name
}