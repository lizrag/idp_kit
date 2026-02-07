variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "Bloque CIDR principal de la VPC"
  type        = string
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad"
  type        = list(string)
}

variable "public_subnets" {
  description = "Lista de CIDRs para las subredes públicas"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de CIDRs para las subredes privadas"
  type        = list(string)
}

variable "cluster_name" {
  description = "Nombre del clúster EKS (usado para el etiquetado de subredes)"
  type        = string
}

variable "environment"{
    type = string
}
