variable "humber_id" {
  description = "The Humber ID for resource naming."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}


variable "linux_vm_ids" {
  description = "List of Linux VM IDs"
  type        = list(string)
}

variable "windows_vm_ids" {
  description = "List of Windows VM IDs"
  type        = list(string)
}


variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
}
  variable "vm_ids" {
  description = "A map of VM IDs to attach the disks to"
  type        = map(string)
  default     = {
    0 = "linux-vm1-id"
    1 = "linux-vm2-id"
    2 = "linux-vm3-id"
    3 = "windows-vm-id"
  }
}

