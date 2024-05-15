data "azurerm_subnet" "selected_subnet" {
  name                 = var.virtual_network_subnet.name
  virtual_network_name = var.virtual_network_subnet.vnet_name
  resource_group_name  = var.virtual_network_subnet.rg_name
}
