variable "location" {
  description = "Azure region where the resource group will be created"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "The Humber ID of the student"
  type        = string
  default     = "4966-RG"
}

locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "rimjhim.raghuwanshi"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}


variable "humber_id" {
  description = "Humber ID"
  type        = string
  default     = "n01654966"
}



variable "postgresql_version" {
  description = "The version of PostgreSQL to use"
  default     = "11"
}

variable "ssl_enforcement_enabled" {
  description = "Whether SSL enforcement is enabled"
  default     = true
}

variable "admin_password" {
  type    = string
  default = "rimjhim@1208"  # Replace with your actual admin password
}

variable "admin_username" {
  type    = string
  default = "rimjhim1208"  # Replace with your actual admin username
}

