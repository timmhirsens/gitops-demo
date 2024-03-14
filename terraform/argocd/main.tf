provider "helm" {
  kubernetes {
    host                   = var.k8s_host
    token                  = var.k8s_token
    cluster_ca_certificate = base64decode(var.k8s_cluster_ca_certificate)
  }

}

provider "kubectl" {
  load_config_file       = false
  host                   = var.k8s_host
  token                  = var.k8s_token
  cluster_ca_certificate = base64decode(var.k8s_cluster_ca_certificate)
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "6.7.2"
  namespace        = "argocd"
  create_namespace = true

  values = [
    file("yaml/values.yaml")
  ]
}

resource "kubectl_manifest" "app_of_apps" {
  yaml_body  = file("yaml/app-of-apps.yaml")
  depends_on = [helm_release.argocd, kubectl_manifest.sealed_repo_secret]
}

resource "kubectl_manifest" "sealed_repo_secret" {
  yaml_body  = file("yaml/sealed-repo-secret.json")
  depends_on = [helm_release.argocd]
}
