terraform {
  backend "s3" {
  }
}

module "bastion" {
  source = "../../../modules/bastion"

  region                      = "eu-west-3"
  env                         = "dev"
  network_remote_state_bucket = var.bucket
  network_remote_state_key    = var.network_key
  instance_type               = "t2.micro"
  image_id                    = "ami-0fc468390088adc22" //Debian Stretch
  ssh_public_key              = var.ssh_public_key
}
