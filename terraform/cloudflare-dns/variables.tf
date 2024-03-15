variable "do_token" {
  type        = string
  description = "access token for the digital ocean API"
}

variable "cf_token" {
  type        = string
  description = "access token for the cloudflare API"
}

variable "k8s_host" {
  type = string
}

variable "k8s_token" {
  type = string
}

variable "k8s_cluster_ca_certificate" {
  type = string
}

