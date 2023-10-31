output "vm-dev_name" {
    description = "Nom de la machine virtuelle de base de données créée."
    value       = google_compute_instance.vm-dev.name
}

output "vm-dev_self_link" {
    description = "Lien vers la machine virtuelle de base de données créée."
    value       = google_compute_instance.vm-dev.self_link
}

output "VmDev_public_ip" {
    description = "Adresse IP privée de la machine virtuelle de base de données."
    value       = google_compute_instance.vm-dev.network_interface[0].access_config[0].nat_ip
}

output "VmDev_internal_ip" {
    description = "Adresse IP interne de la machine virtuelle de base de données."
    value       = google_compute_instance.vm-dev.network_interface[0].network_ip
}