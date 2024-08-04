# outputs.tf
output "data_disk_ids" {
  description = "IDs of the created data disks"
  value       = azurerm_managed_disk.data_disks[*].id
}
