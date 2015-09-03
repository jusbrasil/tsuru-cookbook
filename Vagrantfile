# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = "11.12.8"
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe("tsuru::fullstack")
  end
end
