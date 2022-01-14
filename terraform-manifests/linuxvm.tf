resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  count = var.server_instance
  name = "${local.resource_name_prefix}-${var.hostname}-${count.index}"
  resource_group_name = azurerm_resource_group.rsg.name
  location = azurerm_resource_group.rsg.location
  size = var.size
  admin_username = var.user
  admin_password = var.password
  disable_password_authentication = false
  network_interface_ids = [
    element(azurerm_network_interface.web_vnic[*].id, count.index),
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference { 
    publisher = "Redhat"
    offer     = "RHEL"
    sku       = "7.5"
    version   = "latest"
    }

   # custom_data = filebase64("${path.module}/app-scripts/bootstrap.sh")
    
  }

  
 