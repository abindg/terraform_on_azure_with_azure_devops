# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
    null = {
      source = "hashicorp/null"
      version = "3.1.0"
    }
  }

  #backend "azurerm" {
  #  
  #}

}

# Provider Block
provider "azurerm" {
 features {}          
}

# Random String Resource
resource "random_string" "abinrandom" {
  length = 6
  upper = false 
  special = false
  number = false   
}


