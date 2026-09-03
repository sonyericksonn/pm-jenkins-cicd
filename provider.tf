terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc09"
    }
  }

  backend "s3" {
    bucket = "proxmox-state"
    key    = "terraform.tfstate"
    region = "placeholder"


    endpoints = {
      s3 = "http://172.18.0.2:9000"
    }

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    use_path_style              = true

    #    locals  {
    #      source  = "hashicorp/local"
    #      version = "2.5.2"
  }
}
provider "proxmox" {
  pm_api_url = "https://192.168.0.50:8006/api2/json"
  #  username = "root@pam"
  #  password = "proxmox1"
  pm_tls_insecure = true
}







