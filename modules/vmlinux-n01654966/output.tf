
output "linux_vm_hostnames" {
  value = [for vm in azurerm_linux_virtual_machine.virtual_machine : vm.computer_name]
}

output "linux_vm_fqdns" {
  value = [for pip in azurerm_public_ip.public_ip : pip.fqdn]
}

output "linux_vm_private_ips" {
  value = [for nic in azurerm_network_interface.nic : nic.private_ip_address]
}

output "linux_vm_public_ips" {
  value = [for pip in azurerm_public_ip.public_ip : pip.ip_address]
}


output "vm_ids" {
  description = "The IDs of the Linux VMs."
   value       = [for vm in azurerm_linux_virtual_machine.virtual_machine : vm.id]
}


