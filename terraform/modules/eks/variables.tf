variable "cluster_name"{
    type = string
}

variable "cluster_version"{
    type = number
}

variable "node_group_name" {
    type = string
}

variable "vpc_id" {
    type = number
}

variable "private_subnet_ids" {
    type = list(string)
}

variable "instance_types" {
    type = list(string)
}

variable "min_size" {
    type = number
}

variable "max_size" {
    type = number
}

variable "desired_size"{
    type = number
}

variable "environment"{
    type = string
}
