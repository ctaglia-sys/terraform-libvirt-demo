variable "secret_key" {}
variable "access_key" {}
variable "libvirt_connection" {
    type = string
    default = "qemu:///system"
    # default = "qemu+ssh://root@1.2.3.4/system"
}
variable "vm_name" {
    type = string
    default = "my_vm"
}
variable "memory" {
    type = string
    default = "1024"
}
variable "vcpu" {
    type = number
    default = 1
}

variable "network_name" {
    type = string
    default = "default"
}