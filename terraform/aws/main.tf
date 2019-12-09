#----root/main.tf-----
provider "aws" {
    region = "us-east-1"
}

module "storage" {
    source = "./storage"
}

module "networking" {
    source = "./networking"
    bucket = "${module.storage.logs_bucket}"
}