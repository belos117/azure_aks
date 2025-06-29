data "azurerm_kubernetes_cluster" "this" {
  name                = "${local.env}-${local.aks_name}"
  resource_group_name = local.resource_group_name

  # Comment this out if you get: Error: Kubernetes cluster unreachable 
  depends_on = [azurerm_kubernetes_cluster.this]
}

provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.this.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.this.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.this.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.this.kube_config.0.cluster_ca_certificate)
  }
}

resource "helm_release" "external_nginx" {
  name       = "external"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"

  depends_on = [data.azurerm_kubernetes_cluster.this]
}
