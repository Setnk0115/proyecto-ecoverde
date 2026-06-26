terraform {
  required_version = ">= 1.0.0"
}

locals {
  proyecto = "EcoVerde"
  ambiente = "desarrollo"
}

output "mensaje" {
  value = "Proyecto ${local.proyecto} en ambiente ${local.ambiente}"
}