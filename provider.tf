terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc09"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}


provider "proxmox" {
  pm_api_url = "https://192.168.0.50:8006/api2/json"
  #  username = "root@pam"
  #  password = "proxmox1"
  pm_tls_insecure = true
}







