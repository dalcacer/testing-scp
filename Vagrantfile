# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

   config.vm.define :master do |master|
    master.vm.box = "precise32"
    master.vm.hostname = "master"
    master.vm.network :private_network, ip: "192.168.250.2"
    master.vm.provision :shell,
    :inline => 'grep -qs 192.168.250.3 /etc/hosts || echo "192.168.250.3 minion" >> /etc/hosts'
    master.vm.provision :shell,
    :inline => 'grep -qs 192.168.250.4 /etc/hosts || echo "192.168.250.4 minion2" >> /etc/hosts'
    master.vm.provision :shell,
    :inline => 'grep -qs 192.168.250.2 /etc/hosts || echo "192.168.250.2 master salt" >> /etc/hosts'
    master.vm.provider "virtualbox" do |v|
        v.memory = 512
        v.cpus = 2
        v.gui = true
    end
  end


  config.vm.define :minion do |minion|
    minion.vm.box = "precise32"
    minion.vm.hostname = "minion"
    minion.vm.network :private_network, ip: "192.168.250.3"
    minion.vm.provision :shell,
    :inline => 'grep -qs 192.168.250.2 /etc/hosts || echo "192.168.250.2 master salt" >> /etc/hosts'
    minion.vm.provider "virtualbox" do |v|
        v.memory = 512
        v.cpus = 2
    end
  end

end
