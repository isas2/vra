provider "vra" {
  url            = var.vra_url
  refresh_token  = var.vra_refresh_token
}

data "vra_project" "this" {
  name           = var.project_name
}

data "vra_network" "this" {
  name           = var.network_name
}

resource "vra_machine" "vm_test" {
  name           = "${var.vm_prefix}-as1"
  description    = var.vm_description
  project_id     = data.vra_project.this.id
  image          = var.vm_image
  flavor         = var.vm_flavor

  nics {
    network_id   = data.vra_network.this.id
    addresses    = var.vm_ip_address
  }
}