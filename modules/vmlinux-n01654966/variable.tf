variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Location"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "storage_account_uri" {
  description = "Storage account URI"
  type        = string
}

variable "admin_username" {
  description = "Admin username"
  type        = string
}

variable "public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}

variable "private_key_path" {
  description = "Path to the SSH private key"
  type        = string
}

variable "vm_size" {
  description = "VM size"
  type        = string
}

variable "humber_id" {
  description = "Humber ID"
  type        = string
}

variable "vm_names" {
  description = "Map of VM names"
  type        = map(string)
  default = {
    vm1 = "linux-vm1"
    vm2 = "linux-vm2"
    vm3 = "linux-vm3"
  }
}



variable "tags" {
  description = "Tags to be applied to resources."
  type        = map(string)
}


