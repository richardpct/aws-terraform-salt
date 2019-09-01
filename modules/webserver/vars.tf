variable "region" {
  description = "region"
}

variable "env" {
  description = "environment"
}

variable "network_remote_state_bucket" {
  description = "bucket"
}

variable "network_remote_state_key" {
  description = "network key"
}

variable "bastion_remote_state_bucket" {
  description = "bucket"
}

variable "bastion_remote_state_key" {
  description = "bastion key"
}

variable "saltmaster_remote_state_bucket" {
  description = "bucket"
}

variable "saltmaster_remote_state_key" {
  description = "saltmaster key"
}

variable "image_id" {
  description = "image id"
}

variable "instance_type" {
  description = "instance type"
}
