resource "google_compute_instance" "vm-dev" {
    name         = var.vm-dev
    machine_type = var.type
    zone         = var.zone
    tags         = ["vm-dev"]

    service_account {
        email  = var.service_account_email
        scopes = ["cloud-platform"]
    }

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }

    network_interface {
        network     = var.network_self_link
        subnetwork  = var.subnet_self_link
    access_config {
        }
    }
}