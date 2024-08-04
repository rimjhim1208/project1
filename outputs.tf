output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.resource_group.resource_group_name
}

output "location" {
  description = "The name of the resource group"
  value       = module.resource_group.location
}


output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "nsg_name" {
  value = module.network.nsg_name
}


output "log_analytics_name" {
  value = module.common.log_analytics_name
}

output "recovery_vault_name" {
  value = module.common.recovery_vault_name
}

output "storage_account_name" {
  value = module.common.storage_account_name
}


output "linux_vm_hostnames" {
  value = module.linux_vms.linux_vm_hostnames
}

output "linux_vm_fqdns" {
  value = module.linux_vms.linux_vm_fqdns
}

output "linux_vm_private_ips" {
  value = module.linux_vms.linux_vm_private_ips
}

output "linux_vm_public_ips" {
  value = module.linux_vms.linux_vm_public_ips
}



output "vm_names" {
  description = "The names of the Windows VMs."
  value       = module.vmwindows.vm_names
}

output "vm_private_ips" {
  description = "The private IP addresses of the Windows VMs."
  value       = module.vmwindows.vm_private_ips
}

output "vm_public_ips" {
  description = "The public IP addresses of the Windows VMs."
  value       = module.vmwindows.vm_public_ips
}

output "vm_fqdn" {
  description = "The FQDNs of the Windows VMs."
  value       = module.vmwindows.vm_fqdns
}



output "data_disk_ids" {
  description = "The IDs of the data disks created."
  value       = module.datadisk.data_disk_ids
}


output "load_balancer_name" {
  value = module.load_balancer.load_balancer_name
}
