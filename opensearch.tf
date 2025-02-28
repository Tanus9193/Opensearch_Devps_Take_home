
resource "helm_release" "opensearch_operator" {
  name       = "opensearch-operator"
  repository = "https://opensearch-project.github.io/opensearch-k8s-operator"
  chart      = "opensearch-operator"
  namespace  = "opensearch"
  create_namespace = true
}


variable "opensearch_username" {
  description = "OpenSearch admin username"
  type        = string
  sensitive   = true
}

variable "opensearch_password" {
  description = "OpenSearch admin password"
  type        = string
  sensitive   = true
}

resource "kubernetes_secret" "opensearch_credentials" {
  metadata {
    name      = "opensearch-credentials"
    namespace =  "opensearch"
  }
 depends_on  = [ helm_release.opensearch_operator ]

  data = {
    OPENSEARCH_USERNAME = var.opensearch_username
    OPENSEARCH_PASSWORD = var.opensearch_password
  }
  type = "Opaque"
}

data "external" "alb_ingress" {
  program = ["bash", "${path.module}/get_ingress.sh"]
}

output "alb_ingress_hostname" {
  value = data.external.alb_ingress.result["output"]
}

