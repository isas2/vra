provider "vra" {
  url               = var.url
  refresh_token     = var.refresh_token
  insecure          = var.insecure
}

data "vra_project" "this" {
  name              = var.project_name
}

resource "random_id" "this" {
  byte_length       = 4
}

data "vra_blueprint" "this" {
  name              = var.blueprint_name
}

resource "vra_deployment" "this" {
  name              = "${var.deployment_name} - ${random_id.this.hex}"
  description       = var.deployment_descr
  project_id        = data.vra_project.this.id
  blueprint_id      = data.vra_blueprint.this.id
  blueprint_version = var.blueprint_version
  inputs = {
    vmCount         = var.vm_count
    vmSize          = var.vm_flavor
    imageName       = var.image
  }
  timeouts {
    create          = "60m"
    delete          = "20m"
    update          = "30m"
  }
}

output "addresses_by_vmname" {
  description = "VM name and IP addresses from a vRA deployment"
  value = {
    for props in vra_deployment.this.resources.*.properties_json :
    jsondecode(props).resourceName => jsondecode(props).address
    if try(jsondecode(props).componentType, "") == "Cloud.vSphere.Machine"
  }
}

output "resource_properties_by_name" {
  description = "Properties of all resources by its name from a vRA deployment"
  value = {
    for rs in vra_deployment.this.resources :
    rs.name => jsondecode(rs.properties_json)
  }
}
