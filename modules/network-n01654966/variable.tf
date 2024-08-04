variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be created"
  type        = string
}

variable "humber_id" {
  description = "The Humber ID of the student"
  type        = string
  default     = "n01654966"
}
 
variable "tags" {
  description = "Tags to be applied to resources."
  type        = map(string)
}
