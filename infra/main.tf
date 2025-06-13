terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33"
    }
  }
  backend "azurerm" {
    resource_group_name  = "example-resource-group-tf" # Update with your resource group name
    storage_account_name = "cmdterraform"              # Update with your storage account name
    container_name       = "ghdemo"                    # Update with your blob container name
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_static_web_app" "this" {
  name                = "example-static-web-app"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  # Optional: Configure the SKU tier (Free or Standard). Defaults to Free.
  sku_tier = "Free"
  sku_size = "Free"

  # Optional: Enable or disable preview environments. Defaults to true.
  preview_environments_enabled = true

  # Optional: Enable or disable public network access. Defaults to true.
  public_network_access_enabled = true

  repository_branch = var.branch 
  repository_url    = var.repo_url
  repository_token = var.github_token
    
}

# Output the default hostname of the Static Web App
output "static_web_app_default_hostname" {
  description = "The default host name of the Static Web App."
  value       = azurerm_static_web_app.this.default_host_name
}

# Output the API key of the Static Web App (used for CI/CD integration, e.g., GitHub Actions)
output "static_web_app_api_key" {
  description = "The API key of the Static Web App (sensitive)."
  value       = azurerm_static_web_app.this.api_key
  sensitive   = true # Mark as sensitive to prevent plain-text output in logs
}

