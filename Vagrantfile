# -*- mode: ruby -*-
# vi: set ft=ruby :

dir = Dir.pwd
vagrant_dir = File.expand_path(File.dirname(__FILE__))

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here
  # For a complete reference,  please see the online documentation at docs.vagrantup.com/v2/.
  VM_NAME = "Reed CS VM"

  # Default Ubuntu 17.04 Box 
  config.vm.box = "ubuntu/zesty64"
  config.vm.hostname = "ubuntu"

  # Forward Agent
  #
  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Provision the base Ubuntu box with the Reed CS tools
  config.vm.provision "shell", path: "https://github.com/reed-college/cs-virtualmachine/provisioner.sh"

  ### Virtualbox specific configurations are below.
  # Additional options describer here http://docs.vagrantup.com/v2/virtualbox/configuration.html
  config.vm.provider :virtualbox do |vb|
  # Boot with graphical user interface ("GUI"), this can be commented out if you
  # prefer a non-GUI vm
    vb.gui = true
  # Increasing the memory on the VM is required for successfull compilation of R modules.
    vb.memory = "4096"
  end
end
