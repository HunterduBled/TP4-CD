resource "google_compute_instance" "vm-test" {
    name         = var.vm-test
    machine_type = var.type
    zone         = var.zone
    tags         = ["vm-test"]

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