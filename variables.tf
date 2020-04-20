variable "name" {
  default = "Terraform AMI"
}
# variable "type" {
#   default = "hvm"
# }
# variable "dev" {
#   default = "/dev/xvda"
# }
# variable "arc" {
#   default = "x86_64"
# }
variable "region" {
  default = "us-east-1"
}
variable "subs" {
  type = "list"
  default = ["subnet-09ccff9de42fe92c6", "subnet-0cc7ad0cae1cf039c", "subnet-0e27e902cb9b61ae8"]
}
variable "amitype" {
  }

variable "i_type" {
  }

variable "nlb" {
  }
variable "lb_type" {
  }
variable "vpc" {
  }
variable "tg" {
  }
variable "tg_protocol" {
  }
variable "tg_port" {
  }
variable "tg_type" {
  }
