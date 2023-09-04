terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }
}
provider "azurerm"{
  features {}
}




resource "azurerm_resource_group" "ghouse" {
  name     = "${var.rgname}"
  location = "${var.rglocation}"
}

resource "azurerm_network_security_group" "example" {
  name                = "${var.nsgname}"
  location            = "${var.rglocation}"
  resource_group_name = "${var.rgname}"
}

resource "azurerm_virtual_network" "example" {
  name                = "${var.ventname}"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.rglocation}"
  resource_group_name = "${var.rgname}" 
}

resource "azurerm_subnet" "example" {
  name                 = "${var.subnetname}"
  resource_group_name  = "${var.rgname}"
  virtual_network_name = "${var.ventname}"
  address_prefixes     = ["10.0.1.0/24"]
}