terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01654966RG"
    storage_account_name = "tfstaten01654966sa"
    container_name       = "tfstatefiles"
    key                  = "assisgment-1"
  }
}
