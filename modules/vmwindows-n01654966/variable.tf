variable "humber_id" {
  description = "The Humber ID for resource naming."
  type        = string
  default     ="n01654966"
}

variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
 default      ="eastus"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the VM will be deployed."
  type        = string
}

variable "storage_account_uri" {
  description = "The URI of the storage account for boot diagnostics."
  type        = string
}

variable "windows_vm_count" {
  description = "The number of VMs to create."
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags to be applied to resources."
  type        = map(string)
}


variable "windows_vm_size" {
  description = "The size of the Windows VM"
  type        = string
}


variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace for diagnostics"
  type        = string
}


variable "admin_username" {
  description = "The admin username for the VMs"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the Windows VM"
  type        = string
}
