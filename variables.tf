variable "env" {
  default = "qa"
  type    = string
}


variable "common_tags" {
  description = "Common tags to be applied to resources"
  type        = map(string)
  default = {

    Owner = "DevOps"
  }
}



variable "instance_type" {
  description = "Prefix for naming convention"
  type        = string
  default     = "t2.medium"
}