generate "versions" {
  path              = "versions.tf"
  if_exists         = "overwrite"
  contents          = file(find_in_parent_folders("versions.tf"))
  disable_signature = true
}

