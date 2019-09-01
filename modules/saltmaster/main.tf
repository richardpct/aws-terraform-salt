provider "aws" {
  region = var.region
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = var.network_remote_state_bucket
    key    = var.network_remote_state_key
    region = var.region
  }
}

data "terraform_remote_state" "bastion" {
  backend = "s3"

  config = {
    bucket = var.bastion_remote_state_bucket
    key    = var.bastion_remote_state_key
    region = var.region
  }
}

data "template_file" "user_data" {
  template = "${file("${path.module}/user-data.sh")}"
}

resource "aws_instance" "saltmaster" {
  ami                    = var.image_id
  user_data              = data.template_file.user_data.rendered
  instance_type          = var.instance_type
  key_name               = data.terraform_remote_state.bastion.outputs.ssh_key
  subnet_id              = data.terraform_remote_state.network.outputs.subnet_private_id
  vpc_security_group_ids = [data.terraform_remote_state.network.outputs.sg_saltmaster_id]

  tags = {
    Name = "saltmaster-${var.env}"
  }
}
