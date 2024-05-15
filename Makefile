ifndef CONFIG_DIR
override CONFIG_DIR = configs/
endif

tf-clean:
	rm -f terraform.tfplan terraform.tfstate* $(CONFIG_DIR)/terraform.tfplan && rm -fR .terraform* .terraform/ modules/azure_linux_web_app/.terraform* modules/app-service-plan/.terraform*

validate:
	# Validate the infrastructure.
	terraform init -backend-config="key=$(SUBS_NAME)/$(ENVT_NAME)-azure_linux_web_app.tfstate" && terraform get && terraform validate

plan:validate
	terraform init -backend-config="key=$(SUBS_NAME)/$(ENVT_NAME)-azure_linux_web_app.tfstate" && terraform get -update && terraform plan -var-file="$(CONFIG_DIR)/config-$(ENVT_NAME).json" -out="$(CONFIG_DIR)/terraform.tfplan"

create:
	# Get the modules, create the infrastructure.
	terraform init -backend-config="key=$(SUBS_NAME)/$(ENVT_NAME)-azure_linux_web_app.tfstate" && terraform get && terraform apply -auto-approve -var-file="$(CONFIG_DIR)/config-$(ENVT_NAME).json"

destroy:
	terraform init -backend-config="key=$(SUBS_NAME)/$(ENVT_NAME)-azure_linux_web_app.tfstate" && terraform get && terraform destroy -auto-approve -var-file="$(CONFIG_DIR)/config-$(ENVT_NAME).json"
