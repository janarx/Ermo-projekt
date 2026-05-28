variable "vm_count" {
  description = "Number of VMs to deploy"
  type        = number
  default     = 3
}

variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
  default     = "https://192.168.10.160:8006/api2/json"
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
  default     = "root@pam!terraform"
}

variable "pm_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  sensitive   = true
  default     = "acabac26-e909-4f78-aefd-e8a9268c3eda"
}

variable "target_node" {
  description = "Proxmox node name"
  type        = string
  default     = "pve"
}

variable "template_name" {
  description = "Cloud-init template name"
  type        = string
  default     = "ubuntu-2404-cloudinit-template"
}

variable "vm_names" {
  description = "Names for each VM"
  type        = list(string)
  default     = ["web-01", "db-01", "monitor-01"]
}

variable "vm_ips" {
  description = "IP addresses for each VM"
  type        = list(string)
  default     = ["192.168.10.161", "192.168.10.162", "192.168.10.163"]
}

variable "gateway" {
  description = "Default gateway"
  type        = string
  default     = "192.168.10.1"
}

variable "cpu_cores" {
  description = "CPU cores per VM"
  type        = number
  default     = 4
}

variable "memory" {
  description = "RAM per VM in MB"
  type        = number
  default     = 4096
}

variable "disk_size" {
  description = "Disk size per VM"
  type        = string
  default     = "40G"
}

variable "storage" {
  description = "Proxmox storage name"
  type        = string
  default     = "local-lvm"
}

variable "network_bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "ciuser" {
  description = "Cloud-init login user"
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCZZw1kwtWhxPEazOwMSNYsOTCv11gCeEAUvapPEyWYVpVXgYVyPcUbl8/xMrkPQCRaeNy0+UtQBvBz3MQRGzR14AF5g4+8xXTBDKtceN/7BHKTIk9X4zAsBhTzPD2R738slh5KRsa1Babxue2c5D83mPycaef/Kjnh7giQzLwdJqeQZNe1ESnoLPCASjcX/YnkyuIJ5CpGAIIas9q4KswK5L9/cIhhMshyQ+ZOVYq+PIxJBXVGjge9Sf29k/99kNEIw6c4xoCmz1dqMAgMCquf+1D98iFkCTiLpeWtPOjbttfqMDchm2JSNouRYV09L6ST5tOCcmwC66gX3FXjp4K6KkMVTrgFmxVAeZMCJN9jMMuqOiV4nd5ROsh7OLbzmjg3R1m1DYIQHaZib6o8hBonfutqRCPCY9HJ/b+86SE/o9Ki5r4YoIZUmp5wB83RCkRBP9G+oJL187VWGYQUsbA4COKcsztIjrct2E5KPdRwtmqisQ8rPzEraDs+5HbZuBLZEhs5l9T0b+TONllCPlqAl+7gPFDblDm1Dzz2wwjpPpNB2Y3bP5kzbLhal0nnXYg0nqlI9BMhBdHUsGQkPuKOziYzYA6yAUWKkq8DIXaXeSd4M7tILJQV2vh1yOpdmYqJG0/BRb4qnezEYnX1MAG9ImdcyVrdmV0wJsfNJjdWrQ== jervi@DESKTOP-C2J975C"
}

variable "cipassword" {
  description = "Cloud-init user password"
  type        = string
  sensitive   = true
  default     = "ubuntu123"
}

variable "proxmox_ssh_public_key" {
  description = "Proxmox server SSH public key for Ansible"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC13m41/lwqzKLP+XuC6ss9DG1V1/RSMp38rffP8+Gq3tcByqXbd9odhLRqYTMwlsnL++YUl8wayPSF/B1kyfqvqFJNK77+WkpsdWammqNrpTNGTyHoSWnK4UH06ZjxWWC+8U+lXWuXC7ZLjDQPmgeSYBh7l3s91Qj+GdwjREIALOFa9JhoQpmSlhm+nLUxTLQYPrBGCOEW1yh1EmtbnpfX8AkVWcW21OsxXrjQsNvXJJSmO2zh9j2EwBDuba++mKoiceiw4MtaLX8tHMuj6MvnsZS686qT/8fjsCgtDNZPog50qDYAT6M7/I+0yRnQe+UHsLvUqeAEnba/yZOJyRrYlRdV8MhCduoDMhqM4O2mNOyZJE/Izp83Fw6NaisnIEv+X91M7VhG49T9srrn3zc1U+Tn23rZPK/4rtOAZv8b/t8PUMGDGhPs2yLg0ejN/PZyGegSsEW7aOYdBCCd8lVJ06Q2wH3UEqdBWD4g+Dn3ngTwhF7vDhVbOpgyxhzvycgTLBTxB1UA9IgbdSnUBR/9dfOI4E1FLSr3TsseZ5+LaMOJ/v6lwCWN0fET7Li5FyHY3fXlHnUZgusr4khqhUmA1UkTBGgCCzuSYFWDPq6pJotA3Z3+Jdm5Pgb5S89y2AotdQLBmCKMDOY7Oz1YKv2YBhlM66GjbP7Xd2iqlqLamw== root@pve"
}