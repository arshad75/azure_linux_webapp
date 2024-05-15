<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.103.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_web_app.web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app_slot.app_service_linux_slot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app_slot) | resource |
| [azurerm_subnet.selected_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_directory_auth_setttings"></a> [active\_directory\_auth\_setttings](#input\_active\_directory\_auth\_setttings) | Active directory authentication provider settings for app service | `any` | `{}` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The name of the function app | `string` | n/a | yes |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | Function App application settings | `map(any)` | `{}` | no |
| <a name="input_backup_sas_url"></a> [backup\_sas\_url](#input\_backup\_sas\_url) | URL SAS to backup | `string` | `""` | no |
| <a name="input_builtin_logging_enabled"></a> [builtin\_logging\_enabled](#input\_builtin\_logging\_enabled) | Whether AzureWebJobsDashboards should be enabled, default is true | `bool` | `true` | no |
| <a name="input_client_certificate_enabled"></a> [client\_certificate\_enabled](#input\_client\_certificate\_enabled) | Whether client certificate auth is enabled, default is false | `bool` | `false` | no |
| <a name="input_client_certificate_mode"></a> [client\_certificate\_mode](#input\_client\_certificate\_mode) | The option for client certificates | `string` | `"Optional"` | no |
| <a name="input_connect_app_insights_to_law_workspace"></a> [connect\_app\_insights\_to\_law\_workspace](#input\_connect\_app\_insights\_to\_law\_workspace) | Whether the app insights being made should be connected to a workspace id | `bool` | `null` | no |
| <a name="input_connection_strings"></a> [connection\_strings](#input\_connection\_strings) | Connection strings for App Service | `list(map(string))` | `[]` | no |
| <a name="input_daily_memory_time_quota"></a> [daily\_memory\_time\_quota](#input\_daily\_memory\_time\_quota) | The amount of memory in gigabyte-seconds that your app can consume per day, defaults to 0 | `number` | `0` | no |
| <a name="input_enable_app_insights"></a> [enable\_app\_insights](#input\_enable\_app\_insights) | Whether app insights should be made | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Is the function app enabled? Default is true | `bool` | `true` | no |
| <a name="input_force_disabled_content_share"></a> [force\_disabled\_content\_share](#input\_force\_disabled\_content\_share) | Should content share be disabled in storage account? Default is false | `bool` | `false` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Disable http procotol and keep only https | `bool` | `true` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of user managed identity ids to be assigned to the VM. | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The Managed Service Identity Type of this Virtual Machine. | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | Id of the App Service Plan for Function App hosting | `string` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | Specifies the Authentication enabled or not | `any` | `false` | no |
| <a name="input_site_config"></a> [site\_config](#input\_site\_config) | Site config for App Service. See documentation https://www.terraform.io/docs/providers/azurerm/r/app_service.html#site_config. IP restriction attribute is not managed in this block. | `any` | `{}` | no |
| <a name="input_staging_slot_custom_name"></a> [staging\_slot\_custom\_name](#input\_staging\_slot\_custom\_name) | n/a | `any` | n/a | yes |
| <a name="input_staging_slot_enabled"></a> [staging\_slot\_enabled](#input\_staging\_slot\_enabled) | Specifies whether a staging slot is enabled for the Azure App Service. | `bool` | `false` | no |
| <a name="input_storage_key_vault_secret_id"></a> [storage\_key\_vault\_secret\_id](#input\_storage\_key\_vault\_secret\_id) | The secret ID for the connection string of the storage account used by the function app | `string` | `""` | no |
| <a name="input_storage_uses_managed_identity"></a> [storage\_uses\_managed\_identity](#input\_storage\_uses\_managed\_identity) | If you want the storage account to use a managed identity instead of a access key | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |
| <a name="input_virtual_network_subnet"></a> [virtual\_network\_subnet](#input\_virtual\_network\_subnet) | Name of Subnet, Vnet and Resource Group where the App service needs to be created | `any` | n/a | yes |
| <a name="input_web_app_vnet_integration_enabled"></a> [web\_app\_vnet\_integration\_enabled](#input\_web\_app\_vnet\_integration\_enabled) | Enable VNET integration with the Function App. `web_app_vnet_integration_subnet_id` is mandatory if enabled | `bool` | `false` | no |
| <a name="input_web_app_vnet_integration_subnet_id"></a> [web\_app\_vnet\_integration\_subnet\_id](#input\_web\_app\_vnet\_integration\_subnet\_id) | ID of the subnet to associate with the Function App (VNet integration) | `string` | `null` | no |
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | if app insights count is set to true, the ID of the workspace, not the workspace\_id | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_host_name"></a> [default\_host\_name](#output\_default\_host\_name) | TRhe default hostname of the App Service |
| <a name="output_outbound_ip_addresses"></a> [outbound\_ip\_addresses](#output\_outbound\_ip\_addresses) | A comma separated list of outbound IP addresses |
| <a name="output_possible_outbound_ip_addresses"></a> [possible\_outbound\_ip\_addresses](#output\_possible\_outbound\_ip\_addresses) | A comma separated list of outbound IP addresses. not all of which are necessarily in use |
| <a name="output_site_credential"></a> [site\_credential](#output\_site\_credential) | The output of any site credentials |
| <a name="output_web_app_id"></a> [web\_app\_id](#output\_web\_app\_id) | The ID of the App Service. |
| <a name="output_web_app_name"></a> [web\_app\_name](#output\_web\_app\_name) | The name of the App Service. |
| <a name="output_web_identity"></a> [web\_identity](#output\_web\_identity) | The managed identity block from the App Service |
<!-- END_TF_DOCS -->
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

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.92.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_web_app.web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app_slot.app_service_linux_slot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app_slot) | resource |
| [azurerm_subnet.selected_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data |
| [azurerm_linux_web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app_slot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app_slot) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_directory_auth_setttings"></a> [active\_directory\_auth\_setttings](#input\_active\_directory\_auth\_setttings) | Active directory authentication provider settings for app service | `any` | `{}` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The name of the function app | `string` | n/a | yes |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | Function App application settings | `map(any)` | `{}` | no |
| <a name="input_backup_sas_url"></a> [backup\_sas\_url](#input\_backup\_sas\_url) | URL SAS to backup | `string` | `""` | no |
| <a name="input_builtin_logging_enabled"></a> [builtin\_logging\_enabled](#input\_builtin\_logging\_enabled) | Whether AzureWebJobsDashboards should be enabled, default is true | `bool` | `true` | no |
| <a name="input_client_certificate_enabled"></a> [client\_certificate\_enabled](#input\_client\_certificate\_enabled) | Whether client certificate auth is enabled, default is false | `bool` | `false` | no |
| <a name="input_client_certificate_mode"></a> [client\_certificate\_mode](#input\_client\_certificate\_mode) | The option for client certificates | `string` | `"Optional"` | no |
| <a name="input_connect_app_insights_to_law_workspace"></a> [connect\_app\_insights\_to\_law\_workspace](#input\_connect\_app\_insights\_to\_law\_workspace) | Whether the app insights being made should be connected to a workspace id | `bool` | `null` | no |
| <a name="input_connection_strings"></a> [connection\_strings](#input\_connection\_strings) | Connection strings for App Service | `list(map(string))` | `[]` | no |
| <a name="input_daily_memory_time_quota"></a> [daily\_memory\_time\_quota](#input\_daily\_memory\_time\_quota) | The amount of memory in gigabyte-seconds that your app can consume per day, defaults to 0 | `number` | `0` | no |
| <a name="input_enable_app_insights"></a> [enable\_app\_insights](#input\_enable\_app\_insights) | Whether app insights should be made | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Is the function app enabled? Default is true | `bool` | `true` | no |
| <a name="input_force_disabled_content_share"></a> [force\_disabled\_content\_share](#input\_force\_disabled\_content\_share) | Should content share be disabled in storage account? Default is false | `bool` | `false` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Disable http procotol and keep only https | `bool` | `true` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of user managed identity ids to be assigned to the VM. | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The Managed Service Identity Type of this Virtual Machine. | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | Id of the App Service Plan for Function App hosting | `string` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | Specifies the Authentication enabled or not | `any` | `false` | no |
| <a name="input_site_config"></a> [site\_config](#input\_site\_config) | Site config for App Service. See documentation https://www.terraform.io/docs/providers/azurerm/r/app_service.html#site_config. IP restriction attribute is not managed in this block. | `any` | `{}` | no |
| <a name="input_staging_slot_custom_name"></a> [staging\_slot\_custom\_name](#input\_staging\_slot\_custom\_name) | n/a | `any` | n/a | yes |
| <a name="input_staging_slot_enabled"></a> [staging\_slot\_enabled](#input\_staging\_slot\_enabled) | Specifies whether a staging slot is enabled for the Azure App Service. | `bool` | `false` | no |
| <a name="input_storage_key_vault_secret_id"></a> [storage\_key\_vault\_secret\_id](#input\_storage\_key\_vault\_secret\_id) | The secret ID for the connection string of the storage account used by the function app | `string` | `""` | no |
| <a name="input_storage_uses_managed_identity"></a> [storage\_uses\_managed\_identity](#input\_storage\_uses\_managed\_identity) | If you want the storage account to use a managed identity instead of a access key | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |
| <a name="input_virtual_network_subnet"></a> [virtual\_network\_subnet](#input\_virtual\_network\_subnet) | Name of Subnet, Vnet and Resource Group where the App service needs to be created | `any` | n/a | yes |
| <a name="input_web_app_vnet_integration_enabled"></a> [web\_app\_vnet\_integration\_enabled](#input\_web\_app\_vnet\_integration\_enabled) | Enable VNET integration with the Function App. `web_app_vnet_integration_subnet_id` is mandatory if enabled | `bool` | `false` | no |
| <a name="input_web_app_vnet_integration_subnet_id"></a> [web\_app\_vnet\_integration\_subnet\_id](#input\_web\_app\_vnet\_integration\_subnet\_id) | ID of the subnet to associate with the Function App (VNet integration) | `string` | `null` | no |
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | if app insights count is set to true, the ID of the workspace, not the workspace\_id | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_host_name"></a> [default\_host\_name](#output\_default\_host\_name) | TRhe default hostname of the App Service |
| <a name="output_outbound_ip_addresses"></a> [outbound\_ip\_addresses](#output\_outbound\_ip\_addresses) | A comma separated list of outbound IP addresses |
| <a name="output_possible_outbound_ip_addresses"></a> [possible\_outbound\_ip\_addresses](#output\_possible\_outbound\_ip\_addresses) | A comma separated list of outbound IP addresses. not all of which are necessarily in use |
| <a name="output_site_credential"></a> [site\_credential](#output\_site\_credential) | The output of any site credentials |
| <a name="output_web_app_id"></a> [web\_app\_id](#output\_web\_app\_id) | The ID of the App Service. |
| <a name="output_web_app_name"></a> [web\_app\_name](#output\_web\_app\_name) | The name of the App Service. |
| <a name="output_web_identity"></a> [web\_identity](#output\_web\_identity) | The managed identity block from the App Service |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
