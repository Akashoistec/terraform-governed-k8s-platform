resource "kubernetes_deployment" "web" {
  metadata {
    name      = "web"
    namespace = kubernetes_namespace.secure_app.metadata[0].name

    labels = {
      app = "web"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "web"
      }
    }

    template {
      metadata {
        labels = {
          app = "web"
        }
      }

      spec {
        service_account_name = kubernetes_service_account.web_sa.metadata[0].name
        volume {
          name = "nginx-run"
          empty_dir {}
        }
        volume{ 
        name = "nginx-tmp"
        empty_dir {}
        }
        volume {
          name = "nginx-cache"
          empty_dir {}
        }
        container {
          name  = "nginx"
          image = "nginxinc/nginx-unprivileged:1.27-alpine"

          resources {
            limits = {
              cpu    = "200m"
              memory = "128Mi"
            }

            requests = {
              cpu    = "100m"
              memory = "64Mi"
            }
          }

          security_context {
            run_as_non_root = true
            run_as_user     = 101

            allow_privilege_escalation = false
            read_only_root_filesystem  = true

            capabilities {
              drop = ["ALL"]
            }
          }

          port {
            container_port = 8080
          }
          volume_mount {
            name       = "nginx-run"
            mount_path = "/var/run"
         
          }
          volume_mount {
            name       = "nginx-tmp"
            mount_path = "/tmp"
          
          }
          volume_mount {
            name       = "nginx-cache"
            mount_path = "/var/cache/nginx"
          }
        }
      }
    }
  }
}

