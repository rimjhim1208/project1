variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "4966-RG"
}

variable "location" {
  description = "Location"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources."
  type        = map(string)
}
