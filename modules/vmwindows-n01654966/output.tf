output "vm_names" {
  description = "The names of the Windows VMs."
  value       = azurerm_windows_virtual_machine.virtual_machine[*].name
}

output "vm_private_ips" {
  description = "The private IP addresses of the Windows VMs."
  value       = azurerm_network_interface.nic[*].private_ip_address
}

output "vm_public_ips" {
  description = "The public IP addresses of the Windows VMs."
  value       =  azurerm_public_ip.public_ip[*].ip_address 
}

output "vm_fqdns" {
  value = azurerm_public_ip.public_ip[*].fqdn
}

output "windows_vm_ids" {
  value = [for vm in azurerm_windows_virtual_machine.virtual_machine : vm.id]
}


