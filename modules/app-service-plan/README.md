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
| [azurerm_service_plan.plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_environment_id"></a> [app\_service\_environment\_id](#input\_app\_service\_environment\_id) | The ID of the App Service Environment to create this Service Plan in. Requires an Isolated SKU. Use one of I1, I2, I3 for azurerm\_app\_service\_environment, or I1v2, I2v2, I3v2 for azurerm\_app\_service\_environment\_v3 | `string` | `null` | no |
| <a name="input_app_service_plan_name"></a> [app\_service\_plan\_name](#input\_app\_service\_plan\_name) | Azure App service plan name | `string` | n/a | yes |
| <a name="input_custom_name"></a> [custom\_name](#input\_custom\_name) | Name of the App Service Plan, generated if not set. | `string` | `""` | no |
| <a name="input_default_tags_enabled"></a> [default\_tags\_enabled](#input\_default\_tags\_enabled) | Option to enable or disable default tags | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_maximum_elastic_worker_count"></a> [maximum\_elastic\_worker\_count](#input\_maximum\_elastic\_worker\_count) | The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU | `number` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Optional prefix for the generated name | `string` | `""` | no |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | Optional suffix for the generated name | `string` | `""` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The O/S type for the App Services to be hosted in this plan. Possible values include `Windows`, `Linux`, and `WindowsContainer`. | `string` | n/a | yes |
| <a name="input_per_site_scaling_enabled"></a> [per\_site\_scaling\_enabled](#input\_per\_site\_scaling\_enabled) | Should Per Site Scaling be enabled | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU for the plan. Possible values include B1, B2, B3, D1, F1, FREE, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P0v3, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, Y1, EP1, EP2, EP3, WS1, WS2, and WS3. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Extra tags to add | `map(string)` | `{}` | no |
| <a name="input_use_caf_naming"></a> [use\_caf\_naming](#input\_use\_caf\_naming) | Use the Azure CAF naming provider to generate default resource name. `custom_name` override this if set. Legacy default name is used if this is set to `false`. | `bool` | `true` | no |
| <a name="input_worker_count"></a> [worker\_count](#input\_worker\_count) | The number of Workers (instances) to be allocated | `number` | `1` | no |
| <a name="input_zone_balancing_enabled"></a> [zone\_balancing\_enabled](#input\_zone\_balancing\_enabled) | Should the Service Plan balance across Availability Zones in the region | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_plan_id"></a> [service\_plan\_id](#output\_service\_plan\_id) | ID of the created Service Plan |
| <a name="output_service_plan_location"></a> [service\_plan\_location](#output\_service\_plan\_location) | Azure location of the created Service Plan |
| <a name="output_service_plan_name"></a> [service\_plan\_name](#output\_service\_plan\_name) | Name of the created Service Plan |
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
| [azurerm_service_plan.plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data |
| [azurerm_linux_web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app_slot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app_slot) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_environment_id"></a> [app\_service\_environment\_id](#input\_app\_service\_environment\_id) | The ID of the App Service Environment to create this Service Plan in. Requires an Isolated SKU. Use one of I1, I2, I3 for azurerm\_app\_service\_environment, or I1v2, I2v2, I3v2 for azurerm\_app\_service\_environment\_v3 | `string` | `null` | no |
| <a name="input_app_service_plan_name"></a> [app\_service\_plan\_name](#input\_app\_service\_plan\_name) | Azure App service plan name | `string` | n/a | yes |
| <a name="input_default_tags_enabled"></a> [default\_tags\_enabled](#input\_default\_tags\_enabled) | Option to enable or disable default tags | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_maximum_elastic_worker_count"></a> [maximum\_elastic\_worker\_count](#input\_maximum\_elastic\_worker\_count) | The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU | `number` | `null` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The O/S type for the App Services to be hosted in this plan. Possible values include `Windows`, `Linux`, and `WindowsContainer` | `string` | n/a | yes |
| <a name="input_per_site_scaling_enabled"></a> [per\_site\_scaling\_enabled](#input\_per\_site\_scaling\_enabled) | Should Per Site Scaling be enabled | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU for the plan. Possible values include B1, B2, B3, D1, F1, FREE, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P0v3, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, Y1, EP1, EP2, EP3, WS1, WS2, and WS3. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Extra tags to add | `map(string)` | `{}` | no |
| <a name="input_worker_count"></a> [worker\_count](#input\_worker\_count) | The number of Workers (instances) to be allocated | `number` | `1` | no |
| <a name="input_zone_balancing_enabled"></a> [zone\_balancing\_enabled](#input\_zone\_balancing\_enabled) | Should the Service Plan balance across Availability Zones in the region | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_plan_id"></a> [service\_plan\_id](#output\_service\_plan\_id) | ID of the created Service Plan |
| <a name="output_service_plan_location"></a> [service\_plan\_location](#output\_service\_plan\_location) | Azure location of the created Service Plan |
| <a name="output_service_plan_name"></a> [service\_plan\_name](#output\_service\_plan\_name) | Name of the created Service Plan |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
