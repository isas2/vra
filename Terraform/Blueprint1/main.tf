provider "vra" {
  url           = var.url
  refresh_token = var.refresh_token
  insecure      = var.insecure
}

data "vra_project" "this" {
  name          = var.project_name
}

resource "random_id" "this" {
  byte_length   = 4
}

resource "vra_blueprint" "this" {
  name          = "${var.blueprint_name} (${random_id.this.hex})"
  description   = "Created by vRA terraform provider"
  project_id    = data.vra_project.this.id

  content = <<-EOT
formatVersion: 1
inputs:
  vmCount:
    type: integer
    minimum: 1
    maximum: 5
  vmSize:
    type: string
    title: VM size
    enum:
      - micro
      - small
      - medium
      - large
    default: small
  imageName:
    type: string
    enum:
      - CentOS_7
      - CentOS_8
      - Debian_9
      - Ubuntu_16
      - Ubuntu_18
      - Windows_2012
      - Windows_2016
    default: CentOS_7
    description: OS type
resources:
  Cloud_Network_1:
    type: Cloud.Network
    properties:
      networkType: existing
  Cloud_vSphere_Machine_1:
    type: Cloud.vSphere.Machine
    properties:
      count: '$${input.vmCount}'
      image: '$${input.imageName}'
      flavor: '$${input.vmSize}'
      cloudConfig: null
      name: 'vra-tf'
      customizationSpec: '$${starts_with(input.imageName, "Windows") ? "tmp-windows-vra" : "tmp-linux-vra"}'
      networks:
        - network: '$${resource.Cloud_Network_1.id}'
          assignment: static
  EOT
}

data "vra_blueprint" "this" {
  name              = vra_blueprint.this.name
  depends_on        = [vra_blueprint.this]
}

resource "vra_blueprint_version" "this" {
  blueprint_id      = data.vra_blueprint.this.id
  change_log        = "First version"
  description       = "Released from vRA terraform provider"
  release           = true
  version           = "1.0.1"
}

resource "vra_deployment" "this" {
  name              = "${var.deployment_name} - ${random_id.this.hex}"
  description       = var.deployment_descr
  project_id        = data.vra_project.this.id
  blueprint_id      = data.vra_blueprint.this.id
  blueprint_version = "1.0.1"

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
