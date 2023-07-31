# VPN Gateway settings
location               = "East US"
resource_group_name    = "us-resource-group"
sku                    = "Basic"
type                   = "Vpn"
vpn_type               = "RouteBased"
active_active          = false
enable_bgp             = false

vpn_gateway_name       = "us-gateway"
public_ip_name         = "us-public-ip"
vnet_name              = "us-virtual-network"
vnet_address_space     = ["10.0.0.0/16"]

# Optional: VPN Client Configuration
vpn_client_config = [
  {
    address_space = ["10.2.0.0/24"]

    root_certificate = {
      name             = "DigiCert-Federated-ID-Root-CA"
      public_cert_data = "YOUR_BASE64_ENCODED_CERT_DATA_HERE"
    }

    revoked_certificate = {
      name       = "Verizon-Global-Root-CA"
      thumbprint = "912198EEF23DCAC40939312FEE97DD560BAE49B1"
    }
  }
]
