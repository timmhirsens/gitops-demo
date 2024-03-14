# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_project" "haeger-demo" {
  name        = "haeger-demo"
  description = "A Project to demo a Kubernetes Cluster Setup with GitOps (ArgoCD)"
  purpose     = "Web Application"
  environment = "Development"
  resources   = [digitalocean_kubernetes_cluster.haeger-demo-cluster.urn]
}

resource "digitalocean_kubernetes_cluster" "haeger-demo-cluster" {
  name   = "haeger-demo"
  region = "fra1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.29.1-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    node_count = 2

  }
}
