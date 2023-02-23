terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.55"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}
provider "aws" {
  region = "eu-central-1"
}

locals {
  mount_point  = "/mnt/teamspeak"
  mount_device = "/dev/sdg"
}

variable "password" {
  type    = string
}

variable "instance_type" {
  type    = string
  default = "t2.nano"
}

variable "mode" {
  type = string
  validation {
    condition     = var.mode == "start" || var.mode == "stop"
    error_message = "Mode must be one of start, or stop."
  }
}

output "public_ip" {
  value = var.mode == "start" ? aws_instance.instance[0].public_ip : null
}
