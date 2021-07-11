data "aws_ami" "centos7" {
  most_recent      = true
  name_regex       = "^Centos-7-DevOps-Practice"
  owners           = ["973714476881"]
}
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket                = "terraform-practice56"
    key                   = "mutable/vpc/${var.ENV}/terraform.tfstate"
    region                = "us-east-1"
  }
}

output "outputs" {
  value = data.terraform_remote_state.vpc.outputs
}
