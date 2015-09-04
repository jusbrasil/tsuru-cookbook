# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
IP = "192.168.50.4"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = "11.12.8"
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "tsuru"
  config.vm.network "private_network", ip: IP

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe("tsuru::fullstack")
    chef.json = {
      tsuru: {
        cname: IP
      }
    }
  end
end
