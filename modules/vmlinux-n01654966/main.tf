resource "azurerm_availability_set" "linux_avs" {
  name                = "${var.humber_id}-linux-avs"
  location            = var.location
  resource_group_name = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true

  tags = var.tags
}

resource "azurerm_public_ip" "public_ip" {
  for_each            = var.vm_names
  name                = "${each.value}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${each.value}-${var.humber_id}"
 tags = var.tags
}

/*
data "azurerm_public_ip" "public_ip" {
  depends_on = [ azurerm_linux_virtual_machine.virtual_machine ]
  for_each = var.vm_names
  name = azurerm_public_ip.public_ip[each.key].name
  resource_group_name = var.resource_group_name
}*/

resource "azurerm_network_interface" "nic" {
  for_each            = var.vm_names
  name                = "${each.value}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[each.key].id
  }
tags = var.tags
}

resource "azurerm_linux_virtual_machine" "virtual_machine" {
  for_each              = var.vm_names
  name                  = each.value
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  size                  = var.vm_size
   availability_set_id = azurerm_availability_set.linux_avs.id
  admin_username        = var.admin_username
  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }
  disable_password_authentication = true

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }


  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each             = azurerm_linux_virtual_machine.virtual_machine
  name                 = "NetworkWatcherAgentLinux"
  virtual_machine_id   = each.value.id
  publisher            = "Microsoft.Azure.NetworkWatcher"
  type                 = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"
  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each             = azurerm_linux_virtual_machine.virtual_machine
  name                 = "AzureMonitorLinuxAgent"
  virtual_machine_id   = azurerm_linux_virtual_machine.virtual_machine[each.key].id
  publisher            = "Microsoft.Azure.Monitor"
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.9"
  tags = var.tags
}




resource "null_resource" "linux_provisioner" {
  for_each = azurerm_linux_virtual_machine.virtual_machine
  depends_on = [azurerm_linux_virtual_machine.virtual_machine]
  provisioner "remote-exec" {

   
    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.private_key_path)
      host        = azurerm_public_ip.public_ip[each.key].fqdn
   }   
inline = ["echo Hello, World! This is ${each.key}."]

}
}
