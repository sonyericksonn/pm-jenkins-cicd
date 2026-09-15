# CORRETO ✅
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }

  # O backend fica aqui, no mesmo nível do required_providers
  backend "s3" {
    bucket                      = "proxmox-state"
    key                         = "terraform.tfstate"
    region                      = "us-east-1"
    endpoint                    = "http://172.18.0.3:9000" # ajuste conforme seu ambiente
    skip_credentials_validation = true
    skip_metadata_check         = true
    skip_region_validation      = true
    force_path_style            = true
  }
}
provider "proxmox" {
  pm_api_url = "https://192.168.0.50:8006/api2/json"
  #  username = "root@pam"
  #  password = "proxmox1"
  pm_tls_insecure = true
}



