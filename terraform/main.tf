provider "proxmox" {
  endpoint  = "https://192.168.10.160:8006/"
  api_token = "root@pam!terraform=acabac26-e909-4f78-aefd-e8a9268c3eda"
  insecure  = true
}

resource "proxmox_virtual_environment_vm" "vm" {
  count     = var.vm_count
  name      = var.vm_names[count.index]
  node_name = var.target_node
  vm_id     = "20${count.index + 1}"

  clone {
    vm_id = data.proxmox_virtual_environment_vms.templates.vms[0].vm_id
    full  = true
  }

  agent {
    enabled = true
  }

  cpu {
    cores = var.cpu_cores
  }

  memory {
    dedicated = var.memory
  }

  disk {
    datastore_id = var.storage
    size         = 40
    interface    = "scsi0"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "${var.vm_ips[count.index]}/24"
        gateway = var.gateway
      }
    }
      user_account {
      username = var.ciuser
      password = "ubuntu123"
      keys     = [var.ssh_public_key, var.proxmox_ssh_public_key]
    }
  }

  network_device {
    bridge = var.network_bridge
  }

  on_boot = true
}

data "proxmox_virtual_environment_vms" "templates" {
  node_name = var.target_node
  filter {
    name   = "name"
    values = [var.template_name]
  }
}
