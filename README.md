# CS Vagrant Boxes

The [Computer Science department](http://www.reed.edu/computer-science/) provides [Vagrant](https://www.vagrantup.com) boxes (pre-built VM images and provisioning scripts) that provide a useful development environment for CS courses.

## Requirements

*   A 64-bit processor
*   At least 4GB of RAM
*   At least 25GB of free disk space

## Setup

A number of packages need to be installed, install all that apply to your platform.

Basic setup:

*   Install [VirtualBox](https://www.virtualbox.org) (you will need at least version 5.2 of VirtualBox for the setup to work correctly)
*   Install [Vagrant](https://www.vagrantup.com/downloads.html) (recommendation is to use the download links on the Vagrant site instead of any package manager versions)
*   If you are using Windows install the [Visual C++ 2010 Redistributable Package](http://www.microsoft.com/en-us/download/details.aspx?id=8328)

## Installation of the Virtual Machine

We provide a customised [`Vagrantfile`](https://www.vagrantup.com/docs/vagrantfile/) via a Github repository. This allows us to provide updates as the lab configuration changes. Apart from this the standard Vagrant workflows apply.

Mac and Linux setup with Git:

    git clone https://github.com/reed-college/cs-virtualmachine
    cd cs-virtualmachine
    vagrant plugin install vagrant-vbguest
    vagrant up
    vagrant ssh
    USER=[your username]; sudo adduser --gecos "" $USER; sudo usermod -aG sudo $USER; sudo usermod -aG vagrant $USER; ln -s /vagrant /home/$USER/

Mac and Linux setup without Git:

    wget https://github.com/reed-college/cs-virtualmachine/archive/master.zip
    unzip master.zip
    vagrant plugin install vagrant-vbguest
    vagrant up
    vagrant ssh
    USER=[your username]; sudo adduser --gecos "" $USER; sudo usermod -aG sudo $USER; sudo usermod -aG vagrant $USER; ln -s /vagrant /home/$USER/

Run the above commands from a terminal or command shell.

The install will take 10-20 minutes to complete.

To use the Ubuntu desktop, logout of the virtual machine and run the following command after the initial install is complete:
    
    vagrant reload

This will restart the virtual machine, and you will be given the Ubuntu login screen.

You can also edit the [`Vagrantfile`](https://www.vagrantup.com/docs/vagrantfile/) to change the amount of memory and cores used by the virtual machine. The [VirtualBox provider reference](https://www.vagrantup.com/docs/virtualbox/configuration.html) has more details.

## Shared Folder

Any files saved in the cs-virtualmachine directory will be visible inside the virtual machine. On the virtual machine, the files are available in the ~/vagrant directory.

## Updating

As new tools are needed, the repository and boxes can be updated.

The repository can be updated using standard [Git workflows](https://help.github.com/articles/fetching-a-remote) or by redownloading the zip file. Run the following commands in the `cs-virtualmachine` directory:

    git pull

To install only the new packages, you run the following command:

    vagrant reload --provision

To completely rebuild the virtual machine, you run the following commands:

    vagrant destroy
    vagrant up
    
Note, in both cases, the files you saved in the cs-virtualmachine directory are not affected by the "vagrant destroy" command.

## Troubleshooting

#### GUI does not load after installation
You may not be on the latest version of VirtualBox's Guest Additions. In the cs-virtualmachine folder, run "vagrant vbguest --do install" and then perform a "vagrant reload"
    

