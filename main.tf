data "azurerm_app_service_plan" "existing" {
  count               = var.create_new_plan ? 0 : 1
  name                = var.app_service_plan_name
  resource_group_name = var.rg_name

  depends_on = [module.service_plan]
}

module "service_plan" {
  source                = "./modules/app-service-plan"
  count                 = var.create_new_plan ? 1 : 0
  location              = var.location
  app_service_plan_name = var.app_service_plan_name
  resource_group_name   = var.rg_name
  os_type               = var.service_plan_settings.os_type
  sku_name              = var.service_plan_settings.sku
  worker_count          = var.service_plan_settings.worker_count
}

module "web_app" {
  source                        = "./modules/azure_linux_web_app"
  rg_name                       = var.rg_name
  location                      = var.location
  tags                          = var.tags
  app_name                      = var.app_name
  service_plan_id               = var.create_new_plan ? module.service_plan.service_plan_id : data.azurerm_app_service_plan.existing[0].id
  identity_type                 = var.identity_type
  public_network_access_enabled = var.public_network_access_enabled
  virtual_network_subnet        = var.virtual_network_subnet
  settings                      = var.settings
  staging_slot_enabled          = var.staging_slot_enabled
  staging_slot_custom_name      = "${var.app_name}-staging"
}
