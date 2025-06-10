resource "helm_release" "cert_manager" {
  name      = "cert-manager"
  chart     = "cert-manager"
  version   = "v1.13.2"
  namespace = "cert-manager"

  repository = "https://charts.jetstack.io"

  set {
    name  = "installCRDs"
    value = "true"
  }

  depends_on = [data.azurerm_kubernetes_cluster.this]
}