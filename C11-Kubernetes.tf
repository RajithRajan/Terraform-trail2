# Kubernetes provider

provider "kubernetes" {
  host                   = (var.create_eks_cluster ? data.aws_eks_cluster.cluster[0].endpoint : null)
  token                  = (var.create_eks_cluster ? data.aws_eks_cluster_auth.cluster[0].token : null)
  cluster_ca_certificate = (var.create_eks_cluster ? base64decode(data.aws_eks_cluster.cluster[0].certificate_authority.0.data) : null)

  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_id]
  }
}

resource "local_sensitive_file" "kubeconfig" {
  content = templatefile("${path.module}/kubeconfig.tpl", {
    cluster_name = module.eks.cluster_id,
    clusterca    = data.aws_eks_cluster.cluster[0].certificate_authority[0].data,
    endpoint     = data.aws_eks_cluster.cluster[0].endpoint,
  })
  filename = "$home/.kube/kubeconfig-eks"

  count = var.create_eks_cluster ? 1 : 0
}