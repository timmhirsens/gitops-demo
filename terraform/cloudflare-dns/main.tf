provider "cloudflare" {
  api_token = var.cf_token
}

provider "kubernetes" {
  host                   = var.k8s_host
  token                  = var.k8s_token
  cluster_ca_certificate = base64decode(var.k8s_cluster_ca_certificate)
}

data "cloudflare_zone" "br0tbox" {
  name = "br0tbox.de"
}

data "kubernetes_service" "kubernetes_loadbalancer" {
  metadata {
    name      = "ingress-nginx-controller"
    namespace = "ingress-nginx"
  }
}

resource "cloudflare_record" "ingress-record" {
  zone_id = data.cloudflare_zone.br0tbox.id
  name    = "*.k8s"
  value   = data.kubernetes_service.kubernetes_loadbalancer.status[0].load_balancer[0].ingress[0].ip
  type    = "A"
  proxied = false
}

output "k8s_loadbalancer" {
  value = data.kubernetes_service.kubernetes_loadbalancer.status[0].load_balancer[0].ingress[0].ip
}
