# Adicione esta declaração no seu variables.tf ou topo do arquivo
variable "ssh_private_key" {
  type      = string
  sensitive = true
}
