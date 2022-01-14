resource "azurerm_public_ip" "webpubip" {
    count = var.server_instance
    name = "${local.resource_name_prefix}-${var.pubipname}-${count.index}"
    resource_group_name = azurerm_resource_group.rsg.name
    location = azurerm_resource_group.rsg.location
    allocation_method = "Dynamic" 
}

resource "azurerm_network_interface" "web_vnic" {
  count = var.server_instance
  name = "${local.resource_name_prefix}-${var.vnicname}-${count.index}"
  resource_group_name = azurerm_resource_group.rsg.name
  location = azurerm_resource_group.rsg.location
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.subnets["${var.webSubnetname}"].id
    private_ip_address_allocation = "Dynamic"
    #private_ip_address = var.privateip
    primary = true
    public_ip_address_id = element(azurerm_public_ip.webpubip[*].id, count.index)
  }

}