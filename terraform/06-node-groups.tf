resource "azurerm_kubernetes_cluster_node_pool" "spot" {
  name                  = "spot"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = "Standard_B2s"
  vnet_subnet_id        = azurerm_subnet.subnet1.id
  orchestrator_version  = local.aks_version
  priority              = "Spot"
  spot_max_price        = -1
  eviction_policy       = "Delete"

  node_count = 5
  min_count  = null
  max_count  = null

  node_labels = {
    role                                    = "spot"
    "kubernetes.azure.com/scalesetpriority" = "spot"
  }

  node_taints = [
    "spot:NoSchedule",
    "kubernetes.azure.com/scalesetpriority=spot:NoSchedule"
  ]

  tags = {
    env = local.env
  }

  lifecycle {
    ignore_changes = [node_count]
  }
}
