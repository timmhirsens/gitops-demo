terraform {
  source = "../../../terraform//doks"
}

include "root" {
  path = find_in_parent_folders("common.hcl")
}

include "vars" {
  path   = find_in_parent_folders("vars.hcl")
  expose = true
}

inputs = {
  do_token = include.vars.locals.do_token
}
