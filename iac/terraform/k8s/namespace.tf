resource "kubernetes_namespace" "secure_app" {
  metadata {
    name = "secure-app"
  }
}
