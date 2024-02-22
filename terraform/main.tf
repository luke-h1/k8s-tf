resource "kubernetes_namespace" "main" {
  metadata {
    name = var.kubernetes_namespace
  }
}

resource "kubernetes_deployment" "main" {
  metadata {
    name = "TF-k8s"
    labels = {
      tier = "Frontend"
    }
    namespace = var.kubernetes_namespace
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        tier = "Frontend"
      }
    }

    template {
      metadata {
        labels = {
          tier = "Frontend"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"
          resources {
            limits = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}