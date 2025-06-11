# azure_aks
A Repository for setting up Azure Kubernetes Service in Azure using terraform and github actions

To manualy register the required providers using azure CLI run the following in terminal

az provider register --namespace Microsoft.Sql
az provider register --namespace Microsoft.ApiManagement
az provider register --namespace Microsoft.Cache
az provider register --namespace Microsoft.DBforMySQL
az provider register --namespace Microsoft.ContainerInstance
az provider register --namespace Microsoft.Web
az provider register --namespace Microsoft.HDInsight
az provider register --namespace Microsoft.DBforPostgreSQL
az provider register --namespace Microsoft.AVS

1. Set Account Subscription

az account set --subscription [{subscription-id}]

2. Download Cluster Credentials

az aks get-credentials --resource-group [{resourec-group-name}] --name [{name}] --overwrite-existing
