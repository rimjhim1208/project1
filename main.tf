provider "local" {}

provider "null" {}

resource "null_resource" "ansible_playbook" {
  provisioner "local-exec" {
    command = "ansible-playbook -i hosts n01654966-playbook.yml"
    working_dir = "${path.module}/../../ansible"
  }
  depends_on = [
    module.linux_vms,
    module.vmwindows,
    module.datadisk,
    module.load_balancer,
    module.database,
  ]
}

module "resource_group" {
  source              = "./modules/rgroup-n01654966"
  resource_group_name = var.resource_group_name
  location            = var.location
   tags                = local.common_tags
}

module "network" {
  source              = "./modules/network-n01654966"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  humber_id           = "n01654966"
   tags                = local.common_tags
}


module "common" {
  source              = "./modules/common-n01654966"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  humber_id           = "n01654966"
   tags                = local.common_tags
}


module "linux_vms" {
  source              = "./modules/vmlinux-n01654966"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  storage_account_uri = module.common.storage_account_uri
  admin_username      = "rimjhim1208"
  public_key_path     = "/home/rimjhim1208/.ssh/id_rsa.pub"
  private_key_path    = "/home/rimjhim1208/.ssh/id_rsa"
  vm_size             = "Standard_B1ms"
  tags                = local.common_tags
  humber_id           = "n01654966"
  vm_names = {
    vm1 = "linux-vm1"
    vm2 = "linux-vm2"
    vm3 = "linux-vm3"
  }
}


module "vmwindows" {
  source              = "./modules/vmwindows-n01654966"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.network.subnet_id
  storage_account_uri = module.common.storage_account_uri
  windows_vm_count            = 1
  tags                = local.common_tags
  windows_vm_size     = "Standard_B1ms"
  log_analytics_workspace_id = module.common.log_analytics_name
  admin_username      = "n01654966"
  admin_password      = "rimjhim@1208"
}



module "datadisk" {
  source              = "./modules/datadisk-n01654966"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  linux_vm_ids        = module.linux_vms.vm_ids
  windows_vm_ids      = module.vmwindows.windows_vm_ids
 tags                = local.common_tags
}


module "load_balancer" {
  source              = "./modules/loadbalancer-n01654966"
  humber_id           = var.humber_id
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
   backend_pool_vm_ids   = module.linux_vms.linux_vm_private_ips
  tags                = local.common_tags

}

module "database" {
  source                  = "./modules/database-n01654966"
  humber_id               = var.humber_id
  location                = var.location
  resource_group_name     = module.resource_group.resource_group_name
  admin_username          = var.admin_username
  admin_password          = var.admin_password
  tags                    = local.common_tags
  postgresql_version      = var.postgresql_version
  ssl_enforcement_enabled = var.ssl_enforcement_enabled
}





