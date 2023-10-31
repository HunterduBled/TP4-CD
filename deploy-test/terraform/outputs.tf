output "instance-user" {
    value = var.user
}

output "VmTest_public_ip" {
    value = module.vm-test.VmTest_public_ip
}

output "VmTest_internal_ip" {
    value = module.vm-test.VmTest_internal_ip
}