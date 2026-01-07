resource "kubernetes_network_policy" "secure_app_default_deny" {
  metadata {
    name      = "default-deny-all"
    namespace = kubernetes_namespace.secure_app.metadata[0].name
  }

  spec {
    pod_selector {}

    policy_types = ["Ingress", "Egress"]
  }
}

resource "kubernetes_network_policy" "allow_web_ingress" {
  metadata {
    name      = "allow-web-ingress"
    namespace = kubernetes_namespace.secure_app.metadata[0].name
  }

  spec {
    pod_selector {
      match_labels = {
        app = "web"
      }
    }

    policy_types = ["Ingress"]

    ingress {
      ports {
        protocol = "TCP"
        port     = 80
      }
    }
  }
}

resource "kubernetes_network_policy" "allow_dns_egress" {
  metadata {
    name      = "allow-dns-egress"
    namespace = kubernetes_namespace.secure_app.metadata[0].name
  }

  spec {
    pod_selector {}

    policy_types = ["Egress"]

    egress {
      to {
        namespace_selector {
          match_labels = {
            "kubernetes.io/metadata.name" = "kube-system"
          }
        }
      }

      ports {
        protocol = "UDP"
        port     = 53
      }
    }
  }
}
