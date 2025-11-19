variable "my-os-image" {
  type = string
  description = "define OS type"
  default = "ami-0cae6d6fe6048ca2c"
}

variable "my-size" {
    type = string
    default = "t2.nano"
}

variable "vm-name" {
    type = string
    default = "brian-vm"
}

variable "my-region" {
    type = string
    default = "us-east-1"
}

variable "private-key-name" {
    type = string
    default = "splunk-key"
}