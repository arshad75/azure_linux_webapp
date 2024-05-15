output "app_service_plan_id" {
  description = "The ID of the Azure App Service Plan."
  value       = var.create_new_plan ? module.service_plan : data.azurerm_app_service_plan.existing[0].id
}

output "web_app_url" {
  description = "The URL of the deployed Azure Web App."
  value       = module.web_app.default_host_name
}

output "web_app_id" {
  description = "The ID of the deployed Azure Web App."
  value       = module.web_app.web_app_id
}
