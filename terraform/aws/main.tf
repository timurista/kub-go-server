#----root/main.tf-----
provider "aws" {
}

module "storage" {
    source = "./storage"
}

module "networking" {
    source = "./networking"
    bucket = module.storage.logs_bucket
}