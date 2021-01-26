provider "vra" {
  url                = var.vra_url
  refresh_token      = var.vra_refresh_token
}

data "vra_project" "this" {
  name               = var.project_name
}

data "vra_network" "this" {
  name               = var.network_name
}

resource "random_id" "this" {
  byte_length        = 4
}

resource "vra_deployment" "this" {
  name               = "${var.deployment_name}-${random_id.this.hex}"
  description        = var.deployment_descr
  project_id         = data.vra_project.this.id
}

resource "vra_block_device" "disk" {
  count             = var.workers_count
  capacity_in_gb    = 5
  name              = "${var.workers_prefix}-disk-0${count.index}"
  project_id        = data.vra_project.this.id
  deployment_id     = vra_deployment.this.id
}

resource "vra_machine" "masters" {
  count             = var.masters_count
  name              = "${var.masters_prefix}-0${count.index}"
  description       = var.masters_description
  project_id        = data.vra_project.this.id
  image             = var.vm_image
  flavor            = var.masters_flavor
  deployment_id     = vra_deployment.this.id

  nics {
    network_id      = data.vra_network.this.id
    addresses       = [var.masters_ip_addresses[count.index]]
  }
}

resource "vra_machine" "workers" {
  count             = var.workers_count
  name              = "${var.workers_prefix}-0${count.index}"
  description       = var.workers_description
  project_id        = data.vra_project.this.id
  image             = var.vm_image
  flavor            = var.workers_flavor
  deployment_id     = vra_deployment.this.id

  nics {
    network_id      = data.vra_network.this.id
    addresses       = [var.workers_ip_addresses[count.index]]
  }

  disks {
    block_device_id = vra_block_device.disk[count.index].id
  }
}