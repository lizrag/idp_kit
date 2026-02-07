############################
# Backend
############################

variable "bucket_name" {
  type = string
}

variable "bucket_key" {
  type = string
}

############################
# Global / Metadata
############################

variable "environment" {
  description = "Environment name (dev, stage, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Environment must be dev, stage or prod"
  }
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

############################
# Networking
############################

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "vpc_cidr must be a valid CIDR block"
  }
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)

  validation {
    condition     = alltrue([for s in var.private_subnets : can(cidrnetmask(s))])
    error_message = "All private_subnets must be valid CIDR blocks"
  }
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)

  validation {
    condition     = alltrue([for s in var.public_subnets : can(cidrnetmask(s))])
    error_message = "All public_subnets must be valid CIDR blocks"
  }
}

############################
# EKS
############################

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.29"
}

variable "node_group_name" {
  type = string
}
variable "instance_types" {
  description = "Instance types for EKS managed node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}
