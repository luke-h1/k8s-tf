variable "kubernetes_config_path" {
  default = "~/.kube/config"
}
variable "kubernetes_config_context" {
  default = "minikube"
}
variable "kubernetes_namespace" {
  default = "ns-created-by-tf"
}