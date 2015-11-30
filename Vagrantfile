# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'
VAGRANTFILE_API_VERSION = "2"

require 'yaml'
servers = YAML.load_file('servers.yaml')

Vagrant.configure("2") do |config|

  # Tell Vagrant where would you like to start your VMs (you can also have a
  # specific per-VM configuration. Do not put this section in case you want to
  # start your VMs on the same host)
  config.vm.provider :libvirt do |libvirt|
    libvirt.host = 'localhost'
    libvirt.username = 'sanjayu'
    libvirt.connect_via_ssh = true
  end

  servers.each do |srv|
    if srv.is_a? Hash
      name = srv.fetch 'name', nil
      box = srv.fetch 'box', nil
      ram = srv.fetch 'ram', nil
      vcpu = srv.fetch 'vcpu', nil
      provider = srv.fetch 'libvirt', nil
      network_details = srv.fetch 'network', nil
      arr = []
      prinet = network_details.fetch 'private_network', nil
      pubnet = network_details.fetch 'public_network', nil
      if prinet.is_a? Hash
        prinet.each_value do |ip|
          arr.push(ip)
        end
      end
      #puts "Private Networks #{arr}"
      br_dev = nil
      br_type = nil
      if pubnet.is_a? Hash
        br_dev = pubnet.fetch 'dev'
        br_type = pubnet.fetch 'type'
      end
      config.vm.define :"#{name}" do |srv|
        srv.vm.box = box
        srv.vm.hostname = "#{name}.libvirt.vm"
        arr.each do |ip|
          #puts "#{ip} <<--"
          srv.vm.network :private_network,
            :ip => ip
        end
        if (br_dev and br_type)
          srv.vm.network :public_network,
            :dev => br_dev,
            :type => br_type,
            :mode => br_type
        end
        srv.vm.provider :libvirt do |domain|
          domain.memory = ram.to_i
          domain.cpus = vcpu.to_i
        end
        srv.vm.synced_folder("puppet/", "/etc/puppet/")
        srv.vm.provision 'shell', :inline =>
        'cp /etc/puppet/hiera.yaml /etc/hiera.yaml'
        srv.vm.provision 'shell', :inline =>
        'puppet apply --debug --verbose --logdest syslog --modulepath /etc/puppet/modules /etc/puppet/manifests/site.pp'
      end
    end
  end
end

