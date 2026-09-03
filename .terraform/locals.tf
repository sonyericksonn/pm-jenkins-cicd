locals {
  agent        = 1
  cdir         = "192.168.0.0/24"
  onboot       = true
  proxmox_node = "eno"
  scsihw       = "virtio-scsi-pci"
  template     = "ubuntu-2204-cloud-init"

  bridge = {
    interface = "vmbr0"
    model     = "virtio"

  }
  disks = {
    main = {
      backup  = "true"
      format  = "raw"
      type    = "disk"
      storage = "local-lvm"
      slot    = "scsi0"
      discard = "true"

    }
    cloudinit = {
      backup  = "true"
      format  = "raw"
      type    = "cloudinit"
      storage = "local-lvm"
      slot    = "ide2"
    }
  }
  # serial is needed to connect via WebGUI console
  serial = {
    id   = 0
    type = "socket"
  }

  # cloud init information to be injected
  cloud_init = {
    user           = "ubuntu"
    password       = "ubuntu"
    ssh_public_key = file("/home/russo/.ssh/id_rsa.pub")

    #ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCX1FHzcPhG9zPBtBeVml/3NY83PIP25gaxxTDAfsjKAEF/0/UjvJ0QxiC/xetwmSVYG4sMRM4+txmWG/jVjgFcyBJqy9GJnnQCQ6uu1oNP8/DyM/Ti+T8B/S4xR88IEuwzdqm/r+k5WbcO6EK6oGrJ6gDb8+PGc8Fz5Of+DrXeJ989vn9DACA2ZYYBLj7M5InVhHYO240GgEGNnvmZZL1v+Jfa5j8OgJfA/SWT98/nJtU5eOgTyzYQ6RG5ke6EJOCKOe55NWgb0R2pjtNN684r8eSs7utm0HfFzX56q53MXpM8HTZKkNgC9nmYXugr644mrPDKyDJYjCaG/b7C0LooPWsfVqS/d/NrEbnYcUt09tCFNb221IDBhz7G16eVSq6AsdQ9nNTyHMxu86FSz9Ch1oZ0BZrmjozaXqsZgr4KeER64QVcAldoJK1EzVM6hcYbkN7PGH9eNYhpQIl+I4NXXL6IhmkCbOE3TEhriWyokpw7iGVLTu10WZBBpRbxhHREvl4MuRdSfReWovJ3+jTU82sS4GnvgwkmtbqWNZcfQ2qdDCfF274Fm9DlR/l5feUk9CdOXfDW6vuyGTF5q4dbFlyzFAmfNexAVRv5qblcTTPs6sw/SSltFdmOsbHpEIXvh992iM2Z2dbrfhdWPVqAGk0u+0X0/RW1ASgqjGwY5Q== russo@eno"
  }

  # master specific configuration
  masters = {
    # how many nodes?
    count = 1

    name_prefix = "k8s-master"
    vmid_prefix = 300

    # hardware info
    cores     = 2
    disk_size = "160G"
    memory    = 2048
    sockets   = 1

    # 192.168.0.7x and so on...
    network_last_octect = 70
    tags                = "masters"
  }

  # worker specific configuration
  workers = {
    count = 1

    name_prefix = "k8s-worker"
    vmid_prefix = 400

    cores     = 1
    disk_size = "160G"
    memory    = 2048
    sockets   = 1

    network_last_octect = 90
    tags                = "workers"
  }
}