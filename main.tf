module "vpn" {
  source = "./vpn"

  # VPN Gateway settings
  vpn_gateway_name       = var.vpn_gateway_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  sku                    = var.sku
  type                   = var.type
  vpn_type               = var.vpn_type
  active_active          = var.active_active
  enable_bgp             = var.enable_bgp

  # Public IP settings
  public_ip_name         = var.public_ip_name
  public_ip_allocation   = var.public_ip_allocation

  # Virtual Network settings
  vnet_name              = var.vnet_name
  vnet_address_space     = var.vnet_address_space

  # VPN Client Configuration
  vpn_client_config      = var.vpn_client_config
}
