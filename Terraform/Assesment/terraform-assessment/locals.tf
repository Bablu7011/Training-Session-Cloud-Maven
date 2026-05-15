locals {

  common_tags = {
    managedBy      = var.managed_by
    deploymentMode = "terraform"
    environment    = var.environment
  }

  name_suffix = "${var.project_name}-${var.environment}-001"

}