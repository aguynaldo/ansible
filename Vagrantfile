# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.env.enable
  config.vm.box_check_update = false
  
  config.vm.define ENV['ANSIBLE_HOSTNAME'] do |ansible|
    ansible.vm.box = ENV['ANBIBLE_BOX']
    ansible.vm.hostname = ENV['ANSIBLE_HOSTNAME']
    ansible.vm.network "public_network", :bridge => ENV['INTERFACE_BRIDGE_HOST_FISICO'], ip: ENV['ANSIBLE_IP']

    if Vagrant.has_plugin?("vagrant-vbguest")
      ansible.vbguest.auto_update = false
    end

    ansible.vm.provider "virtualbox" do |vb|
      vb.name = ENV['ANSIBLE_HOSTNAME']
      vb.memory = ENV['RAM']
      vb.cpus = ENV['CPU']
      vb.customize ["modifyvm", :id, "--groups", ENV['VBOX_GROUP_NAME']]
    end
    ansible.vm.provision "shell", path:"role_ansible.sh"
  end

  # UBUNTU FOCAL 20.04
  config.vm.define ENV['UBUNTU_HOSTNAME'] do |ubuntu|
    ubuntu.vm.box = ENV['UBUNTU_BOX']
    ubuntu.vm.hostname = ENV['UBUNTU_HOSTNAME']
    ubuntu.vm.network "public_network", :bridge => ENV['INTERFACE_BRIDGE_HOST_FISICO'], ip: ENV['UBUNTU_IP']

    # if Vagrant.has_plugin?("vagrant-vbguest")
    #   ubuntu.vbguest.auto_update = false
    # end

    ubuntu.vm.provider "virtualbox" do |vb|
      vb.name = ENV['UBUNTU_HOSTNAME']
      vb.memory = ENV['RAM']
      vb.cpus = ENV['CPU']
      vb.customize ["modifyvm", :id, "--groups", ENV['VBOX_GROUP_NAME']]
    end
    ubuntu.vm.provision "shell", path:"role_debian_like.sh"
  end

  # DEBIAN-10 BUSTER
  config.vm.define ENV['DEBIAN_HOSTNAME'] do |debian|
    debian.vm.box = ENV['DEBIAN_BOX']
    debian.vm.hostname = ENV['DEBIAN_HOSTNAME']
    debian.vm.network "public_network", :bridge => ENV['INTERFACE_BRIDGE_HOST_FISICO'], ip: ENV['DEBIAN_IP']

    # if Vagrant.has_plugin?("vagrant-vbguest")
    #   debian.vbguest.auto_update = false
    # end

    debian.vm.provider "virtualbox" do |vb|
      vb.name = ENV['DEBIAN_HOSTNAME']
      vb.memory = ENV['RAM']
      vb.cpus = ENV['CPU']
      vb.customize ["modifyvm", :id, "--groups", ENV['VBOX_GROUP_NAME']]
    end
    debian.vm.provision "shell", path:"role_debian_like.sh"
  end

  # # CENTOS/RHEL 8.2
  config.vm.define ENV['CENTOS_HOSTNAME'] do |centos|
    centos.vm.box = ENV['CENTOS_BOX']
    centos.vm.hostname = ENV['CENTOS_HOSTNAME']
    centos.vm.network "public_network", :bridge => ENV['INTERFACE_BRIDGE_HOST_FISICO'], ip: ENV['CENTOS_IP']

    if Vagrant.has_plugin?("vagrant-vbguest")
      centos.vbguest.auto_update = false
    end

    centos.vm.provider "virtualbox" do |vb|
      vb.name = ENV['CENTOS_HOSTNAME']
      vb.memory = ENV['RAM']
      vb.cpus = ENV['CPU']
      vb.customize ["modifyvm", :id, "--groups", ENV['VBOX_GROUP_NAME']]
    end
    centos.vm.provision "shell", path:"role_redhat_like.sh"
  end
end
