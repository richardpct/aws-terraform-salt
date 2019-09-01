# Purpose
Deploying a Salt server and a client server for doing some tests

# Requirements
* You must have an AWS account, if you don't have one yet, you may subscribe to
the free tier
* You must install Terraform v0.12.X

# Usage
## Creating the S3 backend to store the Terraform states
If you have not created a S3 backend yet, you may follow my first tutorial
[https://github.com/richardpct/aws-terraform-tuto01](https://github.com/richardpct/aws-terraform-tuto01)

## Setting up the required variables
Copy the aws-terraform-salt.tfvars-sample file into aws-terraform-salt.tfvars
then fill the values according to your needs.

## Getting Help
    $ make help

## Creating the Salt environment
    $ cd aws-terraform-salt/environments/dev
    $ make all

## Testing if salt is working
On the Salt server:

    $ ssh -J admin@bastion admin@saltserver
    $ sudo -i
    $ salt '*' test.version

It should return something like this:

    ip-x-x-x-x.eu-west-3.compute.internal:
    2019.2.0

## Cleaning up
    $ cd aws-terraform-salt/environments/dev
    $ make destroy
