terraform {
  backend "s3" {
  }
}

module "webserver" {
  source = "../../../modules/webserver"

  region                         = "eu-west-3"
  env                            = "dev"
  network_remote_state_bucket    = var.bucket
  network_remote_state_key       = var.network_key
  bastion_remote_state_bucket    = var.bucket
  bastion_remote_state_key       = var.bastion_key
  saltmaster_remote_state_bucket = var.bucket
  saltmaster_remote_state_key    = var.saltmaster_key
  instance_type                  = "t2.micro"
  image_id                       = "ami-0fc468390088adc22" //Debian Stretch
}
