locals {
  env                 = "dev"
  region              = "italynorth"
  resource_group_name = "henk-aks-${local.env}"
  aks_name            = "demo"
  aks_version         = "1.33.0"
}
