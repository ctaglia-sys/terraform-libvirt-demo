resource "libvirt_volume" "centos7-qcow2" {
    name = "centos7-terraform.qcow2"
    pool = "default"
    source = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
    #source = "./CentOS-7-x86_64-GenericCloud.qcow2"
    format = "qcow2"
}
data "template_file" "user_data" {
//        template = "${file("${path.module}/cloud_init.cfg")}"
    template = file("cloud_init.cfg")
}
# Use CloudInit to add the instance
resource "libvirt_cloudinit_disk" "commoninit" {
  name = "commoninit.iso"
  user_data = data.template_file.user_data.rendered
}
resource "libvirt_domain" "my_vm" {
    name = var.vm_name
    memory = var.memory
    vcpu = var.vcpu

    network_interface {
        network_name = var.network_name
    }
    disk {
        volume_id = libvirt_volume.centos7-qcow2.id
    }
    cloudinit = libvirt_cloudinit_disk.commoninit.id
    console {
        type = "pty"
        target_type = "serial"
        target_port = "0"
    }
    graphics {
        type = "spice"
        listen_type = "address"
        autoport = true
    }
}
output "ip" {
  value = libvirt_domain.my_vm.network_interface.network_name
}