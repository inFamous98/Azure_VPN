resource "azurerm_virtual_network_gateway" "vpn_gateway" {
  name                = var.vpn_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  type                = var.type
  vpn_type            = var.vpn_type
  active_active       = var.active_active
  enable_bgp          = var.enable_bgp

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address_allocation = var.public_ip_allocation
    subnet_id                     = azurerm_subnet.gateway_subnet.id
  }
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vnet_name
  location = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "gateway_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = ["10.0.1.0/24"]
}
