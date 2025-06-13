variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "eastus2"
}

variable "swa_name" {
  type        = string
  description = "Name of the Static Web App"
}

variable "repo_url" {
  type        = string
  description = "GitHub repository URL for CI/CD"
}

variable "branch" {
  type        = string
  description = "Branch to deploy from"
  default     = "main"
}

variable "github_token" {
  description = "GitHub Personal Access Token for repository access."
  type        = string
  sensitive   = true
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account name (must be globally unique)"
}
