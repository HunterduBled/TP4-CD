
# PROVIDER
provider "google" {
    credentials = file("../credentials.json")
    project     = var.project_id
    region      = var.region
    zone        = var.zone
    scopes      = [ "https://www.googleapis.com/auth/cloud-platform" ]
}

# MODULES
module "vpc" {
    source      = "./vpc"
    subnet_cidr = var.subnet_cidr
}

module "service_account" {
    source          = "./service_account"
    project_id      = var.project_id
    region          = var.region
    zone            = var.zone
    key_filename    = var.key_filename
    account_id      = var.account_id
    display_name    = var.display_name
}

module "firewall" {
    depends_on          = [ module.vpc ]
    source              = "./firewall"
    network_self_link   = module.vpc.network_self_link
    subnet_self_link    = module.vpc.subnet_self_link
    firewall_source     = var.firewall_source
}

# VM
module "vm-test" {
    depends_on              = [ module.vpc ]
    source                  = "./vm-test"
    network_self_link       = module.vpc.network_self_link
    subnet_self_link        = module.vpc.subnet_self_link
    service_account_email   = module.service_account.service_account_email
}

# CLE SSH
resource "google_compute_project_metadata_item" "ssh_keys" {
    key   = "ssh-keys"
    value = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
}
