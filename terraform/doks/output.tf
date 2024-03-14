output "kube_host" {
  value     = digitalocean_kubernetes_cluster.haeger-demo-cluster.kube_config[0].host
  sensitive = true
}

output "kube_token" {
  value     = digitalocean_kubernetes_cluster.haeger-demo-cluster.kube_config[0].token
  sensitive = true
}

output "client_key" {
  value     = digitalocean_kubernetes_cluster.haeger-demo-cluster.kube_config[0].client_key
  sensitive = true
}

output "client_certificate" {
  value     = digitalocean_kubernetes_cluster.haeger-demo-cluster.kube_config[0].client_certificate
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = digitalocean_kubernetes_cluster.haeger-demo-cluster.kube_config[0].cluster_ca_certificate
  sensitive = true
}
