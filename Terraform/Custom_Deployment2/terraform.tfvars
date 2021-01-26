# vRealize Automation
vra_refresh_token    = "ys7123...321xhN"
vra_url              = "https://vra8.zabedu.ru"
project_name         = "PTO"
network_name         = "pgCIT-vRA"
deployment_name      = "TF VM cluster"
deployment_descr     = "Test multiple VM deployment"
vm_image             = "CentOS_7"
masters_count        = 1
masters_ip_addresses = ["192.168.200.3"]
masters_description  = "Master node"
masters_flavor       = "small"
masters_prefix       = "cl-pto-m"
workers_count        = 2
workers_ip_addresses = ["192.168.200.4", "192.168.200.5"]
workers_description  = "Worker node"
workers_flavor       = "medium"
workers_prefix       = "cl-pto-w"
