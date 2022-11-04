resource "azurerm_resource_group" "financial_control_rg" {
  name     = "financialcontrol-rg"
  location = "East US"
}

resource "azurerm_service_plan" "financial_control_sp" {
  name                = "financialcontrol-sp"
  resource_group_name = azurerm_resource_group.financial_control_rg.name
  location            = azurerm_resource_group.financial_control_rg.location
  os_type             = "Linux"
  sku_name            = "B1"

}

resource "azurerm_linux_web_app" "financial_control_api" {
  name                = "api-financialcontrol"
  location            = azurerm_resource_group.financial_control_rg.location
  resource_group_name = azurerm_resource_group.financial_control_rg.name
  service_plan_id     = azurerm_service_plan.financial_control_sp.id

  site_config {
    always_on = true
    application_stack {
      docker_image     = "jailtonjunior/financial_api"
      docker_image_tag = "v47"
    }
  }

  app_settings = {
    "ENVIRONMENT"                         = "Production"
    "TZ"                                  = "America/Sao_Paulo"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = false
    "DOCKER_REGISTRY_SERVER_URL"          = "index.docker.io"
    "DOCKER_REGISTRY_SERVER_USERNAME"     = "jailtonjunior"
    "DOCKER_REGISTRY_SERVER_PASSWORD"     = ""
  }
}

resource "azurerm_linux_web_app" "financial_control_web" {
  name                = "financialcontrol"
  location            = azurerm_resource_group.financial_control_rg.location
  resource_group_name = azurerm_resource_group.financial_control_rg.name
  service_plan_id     = azurerm_service_plan.financial_control_sp.id

  site_config {
    always_on = true
    application_stack {
      docker_image     = "jailtonjunior/financial_web"
      docker_image_tag = "v14"
    }
  }

  app_settings = {
    "REACT_APP_BASE_URL_API"              = "https://api-financialcontrol.azurewebsites.net/"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = false
    "DOCKER_REGISTRY_SERVER_URL"          = "index.docker.io"
    "DOCKER_REGISTRY_SERVER_USERNAME"     = "jailtonjunior"
    "DOCKER_REGISTRY_SERVER_PASSWORD"     = ""
  }
}
