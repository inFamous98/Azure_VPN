variable "location" {
  description = "The location/region where the resources will be created."
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
  default     = "us-resource-group"
}

variable "sku" {
  description = "Configuration of the size and capacity of the virtual network gateway."
  type        = string
  default     = "Basic"
}

variable "type" {
  description = "The type of the Virtual Network Gateway."
  type        = string
  default     = "Vpn"
}

variable "vpn_type" {
  description = "The routing type of the Virtual Network Gateway."
  type        = string
  default     = "RouteBased"
}

variable "active_active" {
  description = "If true, an active-active Virtual Network Gateway will be created."
  type        = bool
  default     = false
}

variable "enable_bgp" {
  description = "If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway."
  type        = bool
  default     = false
}

# VPN Gateway variables
variable "vpn_gateway_name" {
  description = "The name of the VPN Virtual Network Gateway."
  type        = string
  default     = "us-gateway"
}

variable "public_ip_name" {
  description = "The name of the public IP address associated with the VPN Gateway."
  type        = string
  default     = "us-public-ip"
}

variable "public_ip_allocation" {
  description = "Defines how the public IP address is allocated. Valid options are Static or Dynamic."
  type        = string
  default     = "Dynamic"
}

# Virtual Network variables
variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "us-virtual-network"
}

variable "vnet_address_space" {
  description = "The address space of the virtual network in CIDR notation."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "vpn_client_config" {
  type = list(object({
    address_space = list(string)

    root_certificate = object({
      name             = string
      public_cert_data = string
    })

    revoked_certificate = object({
      name       = string
      thumbprint = string
    })
  }))
  default = []
}
