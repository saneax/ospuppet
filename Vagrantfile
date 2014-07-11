# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/trusty64"
#      controller.vm.box = "ubuntu/trusty64"
    config.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "site.pp"
      puppet.options = "--verbose --debug"
    end


    config.vm.define "ct1" do |ct1|
      ct1.vm.network "private_network", ip: "172.16.11.21"
      ct1.vm.hostname = "ct1"
      config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
        v.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
      end
    end

    config.vm.define "nt1" do |nt1|
      nt1.vm.network "private_network", ip: "172.16.11.22"
      nt1.vm.hostname = "nt1"
      config.vm.provider "virtualbox" do |v|
        v.memory = 512
        v.cpus = 1
        v.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
      end
    end

    config.vm.define "nd1" do |nd1|
      nd1.vm.network "private_network", ip: "172.16.11.23"
      nd1.vm.hostname = "nd1"
      config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
        v.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
      end
    end

    config.vm.define "nd2" do |nd2|
      nd2.vm.network "private_network", ip: "172.16.11.24"
      nd2.vm.hostname = "nd2"
      config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
        v.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
      end
    end


#    config.vm.define "nd3" do |nd3|
#    nd3.vm.network "private_network", ip: "172.16.11.25"
#     nd3.vm.hostname = "nd3"
#     config.vm.provider "virtualbox" do |v|
#       v.memory = 1024
#       v.cpus = 2
#       v.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
#     end
#   end

end




