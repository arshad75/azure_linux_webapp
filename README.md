# terraform-azurerm-linux-web-app

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# Overview

# Module: Azure Linux Web App and App Service Plan

This Terraform module provisions a Linux-based web application on Azure along with an associated App Service Plan. It offers flexibility to either create a new App Service Plan or utilize an existing one. Additionally, it provides the option to deploy the web app within a Virtual Network (VNet) for enhanced security by making it private and disabling public access.

# Structure

### The module follows the following directory structure:
```
modules/
    app-service-plan/                # Module for provisioning App Service Plan
    azure_linux_web_app/             # Module for provisioning Azure Linux Web App
configs/                             # Environment configurations
.github/workflow/release.yml         # Semantic release pipeline for release process triggers on PR close on main branch
package.json                         # Dependencies for semantic release
Makefile                             # Contains commands for streamlined execution
main.tf                              # Client template for the module
output.tf                            # Outputs configuration
variables.tf                         # Input variables definition
```
### Functionality

  - **App Service Plan Creation**: Users have the flexibility to create a new App Service Plan by setting the `create_plan` argument. If not specified, the module utilizes an existing App Service Plan.
  - **VNet Integration**: The module supports deploying the web app within a Virtual Network (VNet) for enhanced security. Users can pass VNet configurations, including subnet details, to make the web app private and disable public access.
  - **Pre-commit Web Hooks**: Pre-commit web hooks are configured to ensure code quality and adherence to best practices before committing changes.

### Usage config example
To deploy Azure Linux Web App follow the below steps
1. git clone https://github.com/arshad75/azure_linuxweb_app.git
2. In the configs/ dir create a config template following concention config-{ENV}.json for example if your env is prod use config-prod.json
3. Update the values in the config-{ENV}.json
4. Run make from the root directory as shown in the below example

```
make plan ENVT_NAME=prod      - to run terraform plan
make create ENVT_NAME=prod    - to apply the reviewed changes
make destroy ENVT_NAME=prod   - to run terraform destroy
make tf-clean                 - to clean the environment

```

#### config.json
```json
{
  "rg_name": "appservice",
  "location": "eastus",
  "tags": {
      "test": "Tag"
  },
  "app_name": "mylinuxwebapptestdestoy",
  "create_plan": false,
  "identity_type": "SystemAssigned",
  "public_network_access_enabled": false,
  "virtual_network_subnet": {
      "name": "subnet-dev-sea-private-001",
      "vnet_name": "vnet-dev-sea-001",
      "rg_name": "appservice"
  },
  "settings": {
      "site_config": {
        "minimum_tls_version": "1.2",
        "http2_enabled": true,
        "application_stack": {
          "node_version": "18-lts"
        }
      },
      "auth_settings": {
        "enabled": false,
        "runtime_version": "~1",
        "unauthenticated_client_action": "AllowAnonymous"
      }
    },
  "staging_slot_enabled": true,
  "app_service_plan_name": "ASP-appservice-ac8d",
  "os_type": "Linux",
  "sku_name": "P0v3",
  "worker_count": 1,
  "service_plan_settings": {
      "os_type": "Linux",
      "sku": "P0v3",
      "worker_count": "1"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0, < 1.6.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.81.0, < 3.93.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.92.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_service_plan"></a> [service\_plan](#module\_service\_plan) | ./modules/app-service-plan | n/a |
| <a name="module_web_app"></a> [web\_app](#module\_web\_app) | ./modules/azure_linux_web_app | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_plan.existing](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/app_service_plan) | data source |
| [azurerm_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data |
| [azurerm_linux_web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app_slot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app_slot) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The name of the Azure App Service. | `string` | n/a | yes |
| <a name="input_app_service_plan_name"></a> [app\_service\_plan\_name](#input\_app\_service\_plan\_name) | The name of the Azure App Service Plan. | `string` | n/a | yes |
| <a name="input_create_new_plan"></a> [create\_new\_plan](#input\_create\_new\_plan) | Set to true if you want to create a new App Service Plan, or false to use an existing one. | `bool` | `true` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The type of identity to assign to the Azure resources. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the resources will be deployed. | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Specifies whether the app has public network access. | `bool` | `false` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group where the resources will be deployed. | `string` | `""` | no |
| <a name="input_service_plan_settings"></a> [service\_plan\_settings](#input\_service\_plan\_settings) | (Optional) The subnet id which will be used by this Web App for regional virtual network integration | `any` | <pre>{<br>  "os_type": "Linux",<br>  "sku": "P0v3",<br>  "worker_count": "1"<br>}</pre> | no |
| <a name="input_settings"></a> [settings](#input\_settings) | A map of app settings for the Azure App Service. | `any` | `{}` | no |
| <a name="input_staging_slot_enabled"></a> [staging\_slot\_enabled](#input\_staging\_slot\_enabled) | Specifies whether a staging slot is enabled for the Azure App Service. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to all resources. | `map(string)` | `{}` | no |
| <a name="input_virtual_network_subnet"></a> [virtual\_network\_subnet](#input\_virtual\_network\_subnet) | The subnet ID where the App Service will be deployed. | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_plan_id"></a> [app\_service\_plan\_id](#output\_app\_service\_plan\_id) | The ID of the Azure App Service Plan. |
| <a name="output_web_app_id"></a> [web\_app\_id](#output\_web\_app\_id) | The ID of the deployed Azure Web App. |
| <a name="output_web_app_url"></a> [web\_app\_url](#output\_web\_app\_url) | The URL of the deployed Azure Web App. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
