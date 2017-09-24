# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.network 'private_network', nat: 'ens32'
  ["vmware_desktop", "vmware", "vmware_fusion", "vmware_workstation"].each do |vmware_provider|
    config.vm.provider(vmware_provider) do |vmware|
      vmware.whitelist_verified = true
    end
  end
end
