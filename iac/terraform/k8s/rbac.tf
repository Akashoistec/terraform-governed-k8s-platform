resource "kubernetes_role" "web_role" {
  metadata {
    name      = "web-role"
    namespace = kubernetes_namespace.secure_app.metadata[0].name
  }

  rule {
    api_groups = [""]
    resources  = ["pods"]
    verbs      = ["get"]
  }
}

resource "kubernetes_role_binding" "web_binding" {
  metadata {
    name      = "web-binding"
    namespace = kubernetes_namespace.secure_app.metadata[0].name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.web_role.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.web_sa.metadata[0].name
    namespace = kubernetes_namespace.secure_app.metadata[0].name
  }
}

