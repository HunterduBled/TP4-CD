output "instance-user" {
    value = var.user
}

output "VmDev_public_ip" {
    value = module.vm-dev.VmDev_public_ip
}

output "VmDev_internal_ip" {
    value = module.vm-dev.VmDev_internal_ip
}