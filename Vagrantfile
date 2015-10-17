# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

#Load Yaml libraries
require 'yaml'

servers = YAML.load_file('servers.yaml')


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
#    config.vm.box = "ubuntu/trusty64"

    servers.each do |servers|
        config.vm.define servers["name"] do |srv|
            srv.vm.box = servers["box"]
            if srv =~ /nt/
              srv.vm.network "private_network", ip: servers["ip1"]
              srv.vm.network "private_network", ip: servers["ip2"]
              srv.vm.network "private_network", ip: servers["ip3"]
              srv.vm.network "public_network", bridge: "br0:"
            else
              srv.vm.network "private_network", ip: servers["ip1"]
              srv.vm.network "private_network", ip: servers["ip2"]
              srv.vm.network "private_network", ip: servers["ip3"]
            end
            srv.vm.hostname = servers["name"]
            srv.vm.provider :virtualbox do |vb|
                vb.name = servers["name"]
                vb.memory = servers["ram"]
                vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
            end
        end
        config.vm.synced_folder("puppet/", "/etc/puppet/")
        config.vm.provision 'shell', :inline =>
         'cp /etc/puppet/hiera.yaml /etc/hiera.yaml'
        config.vm.provision 'shell', :inline =>
        'puppet apply --debug --verbose --logdest syslog --modulepath /etc/puppet/modules /etc/puppet/manifests/site.pp'
    end
end

