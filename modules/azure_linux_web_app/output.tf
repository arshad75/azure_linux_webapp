output "outbound_ip_addresses" {
  value       = azurerm_linux_web_app.web_app.outbound_ip_addresses
  description = "A comma separated list of outbound IP addresses"
}

output "possible_outbound_ip_addresses" {
  value       = azurerm_linux_web_app.web_app.possible_outbound_ip_addresses
  description = "A comma separated list of outbound IP addresses. not all of which are necessarily in use"
}

output "site_credential" {
  value       = azurerm_linux_web_app.web_app.site_credential
  description = "The output of any site credentials"
}

output "web_app_id" {
  value       = azurerm_linux_web_app.web_app.id
  description = "The ID of the App Service."
}

output "web_app_name" {
  value       = azurerm_linux_web_app.web_app.name
  description = "The name of the App Service."
}

output "web_identity" {
  description = "The managed identity block from the App Service"
  value       = azurerm_linux_web_app.web_app.identity
}

output "default_host_name" {
  description = "TRhe default hostname of the App Service"
  value       = azurerm_linux_web_app.web_app.default_hostname

}
