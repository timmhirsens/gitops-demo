terraform {
  source = "../../../terraform//cloudflare-dns"
}

include "root" {
  path = find_in_parent_folders("common.hcl")
}

include "vars" {
  path   = find_in_parent_folders("vars.hcl")
  expose = true
}

dependency "doks" {
  config_path = "..//doks"
}

inputs = {
  do_token                   = include.vars.locals.do_token
  cf_token                   = include.vars.locals.cf_token
  k8s_host                   = dependency.doks.outputs.kube_host
  k8s_cluster_ca_certificate = dependency.doks.outputs.cluster_ca_certificate
  k8s_token                  = dependency.doks.outputs.kube_token
}
