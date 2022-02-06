terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "1.24.2"
    }
  }
}

provider "vsphere" {
  user           = "administrator@vsphere.local"
  password       = "VMware1!"
  vsphere_server = "172.0.10.10"
  allow_unverified_ssl = true
}


data "vsphere_datacenter" "datacenter" {
  name = "vSAN Datacenter"
}

data "vsphere_host" "esxi_host" {
  name          = "172.0.10.11"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

resource "vsphere_host_virtual_switch" "switch" {
  name           = "EDU-S00"
  host_system_id = "${data.vsphere_host.esxi_host.id}"
  network_adapters = [""]
  active_nics    = [""]
  standby_nics   = [""]
  allow_promiscuous      = true
  allow_forged_transmits = true
  allow_mac_changes      = true  
}

resource "vsphere_host_port_group" "pg1" {
  name                = "S00-Trunk"
  host_system_id      = "${data.vsphere_host.esxi_host.id}"
  virtual_switch_name = "${vsphere_host_virtual_switch.switch.name}"
  vlan_id = 4095  
}

resource "vsphere_host_port_group" "pg2" {
  name                = "S00-Mgmt"
  host_system_id      = "${data.vsphere_host.esxi_host.id}"
  virtual_switch_name = "${vsphere_host_virtual_switch.switch.name}"
  vlan_id = 101  
}

resource "vsphere_host_port_group" "pg3" {
  name                = "S00-Storage"
  host_system_id      = "${data.vsphere_host.esxi_host.id}"
  virtual_switch_name = "${vsphere_host_virtual_switch.switch.name}"
  vlan_id = 102  
}

resource "vsphere_host_port_group" "pg4" {
  name                = "S00-vMotion"
  host_system_id      = "${data.vsphere_host.esxi_host.id}"
  virtual_switch_name = "${vsphere_host_virtual_switch.switch.name}"
  vlan_id = 103  
}



