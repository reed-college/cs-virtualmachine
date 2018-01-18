# -*- mode: ruby -*-
# vi: set ft=ruby :

dir = Dir.pwd
vagrant_dir = File.expand_path(File.dirname(__FILE__))

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here
  # For a complete reference,  please see the online documentation at docs.vagrantup.com/v2/.

  # Default Ubuntu 17.04 Box 
  config.vm.box = "bento/ubuntu-17.10"
  config.vm.hostname = "ubuntu"

  #if Dir.glob("#{File.dirname(__FILE__)}/.vagrant/machines/default/*").empty?
  #  print "Username: "
  #  username = STDIN.gets.chomp
  #  print "Password: "
  #  pw = STDIN.gets.chomp
  #  cmd = "sudo adduser --gecos "" #{username} -p #{pw}; sudo usermod -aG sudo #{username}"
  #  config.vm.provision :shell, :inline => cmd, :privileged => false
  #end

  # Forward Agent
  #
  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Provision the base Ubuntu box with the Reed CS tools
  config.vm.provision "shell", path: "provisioner.sh"

  ### Virtualbox specific configurations are below.
  # Additional options describer here http://docs.vagrantup.com/v2/virtualbox/configuration.html
  config.vm.provider :virtualbox do |vb|
  # Set a custom name in the Virtual Box interface  
    vb.name = "Reed CS VirtualMachine"
  # Boot with graphical user interface ("GUI"), this can be commented out if you
  # prefer a non-GUI vm
    vb.gui = true
  # Increase the memory on the VM is required for successfull compilation of R modules.
    vb.memory = "4096"
  # Increase video memory
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
  end
end
