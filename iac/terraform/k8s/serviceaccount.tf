resource "kubernetes_service_account" "web_sa" {
  metadata {
    name      = "web-sa"
    namespace = kubernetes_namespace.secure_app.metadata[0].name
  }
}

