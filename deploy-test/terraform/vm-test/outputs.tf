output "vm-test_name" {
    description = "Nom de la machine virtuelle de base de données créée."
    value       = google_compute_instance.vm-test.name
}

output "vm-test_self_link" {
    description = "Lien vers la machine virtuelle de base de données créée."
    value       = google_compute_instance.vm-test.self_link
}

output "VmTest_public_ip" {
    description = "Adresse IP privée de la machine virtuelle de base de données."
    value       = google_compute_instance.vm-test.network_interface[0].access_config[0].nat_ip
}

output "VmTest_internal_ip" {
    description = "Adresse IP interne de la machine virtuelle de base de données."
    value       = google_compute_instance.vm-test.network_interface[0].network_ip
}