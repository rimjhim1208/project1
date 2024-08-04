variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Location"
  type        = string
}

variable "humber_id" {
  description = "Humber ID"
  type        = string
}
 
variable "tags" {
  description = "Tags to be applied to resources."
  type        = map(string)
}
