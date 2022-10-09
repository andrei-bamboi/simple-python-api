resource "helm_release" "api" {
  name       = "api"
  chart      = "../api-helm/"
}