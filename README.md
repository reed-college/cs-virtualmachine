# CS Vagrant Boxes

The [Computer Science department](http://www.reed.edu/computer-science/) provides [Vagrant](https://www.vagrantup.com) boxes (pre-built VM images and provisioning scripts) that provide a useful development environment for CS courses.

## Requirements

*   A 64-bit processor
*   At least 4GB of RAM
*   At least 25GB of free disk space

## Setup

A number of packages need to be installed, install all that apply to your platform.

Basic setup:

*   Install [VirtualBox](https://www.virtualbox.org)
*   Install [Vagrant](https://www.vagrantup.com/downloads.html)
*   If you are using Windows install the [Visual C++ 2010 Redistributable Package](http://www.microsoft.com/en-us/download/details.aspx?id=8328)

## Ubuntu 17.04 Virtual Machine

We provide a customised [`Vagrantfile`](https://www.vagrantup.com/docs/vagrantfile/) via a Github repository. This allows us to provide updates as the lab configuration changes. Apart from this the standard Vagrant workflows apply.

Mac and Linux setup with Git:

    git clone https://github.com/reed-college/cs-virtualmachine
    cd cs-virtualmachine
    vagrant up
    vagrant ssh
    sudo adduser [YOUR_USERNAME]

Mac and Linux setup without Git:

    wget https://github.com/reed-college/cs-virtualmachine/archive/master.zip
    unzip master.zip
    vagrant up
    vagrant ssh
    sudo adduser [YOUR_USERNAME]

Run the above commands from a terminal or command shell.

The install will take 20-30 minutes to complete.

To use the Ubuntu desktop, run the following commands after the initial install is complete:
    vagrant halt
    vagrant up

You can also edit the [`Vagrantfile`](https://www.vagrantup.com/docs/vagrantfile/) to change the amount of memory and cores used by the virtual machine. The [VirtualBox provider reference](https://www.vagrantup.com/docs/virtualbox/configuration.html) has more details.

## Shared Folder

Any files saved in the cs-virtualmachine directory will be visible inside the virtual machine. On the virtual machine, the files are available in the /vagrant directory.

## Updating

As new tools are needed, the repository and boxes can be updated.

The repository can be updated using standard [Git workflows](https://help.github.com/articles/fetching-a-remote) or by redownloading the zip file. Run the following commands in the `cs-virtualmachine` directory:

    git pull

Then run:

    vagrant halt
    vagrant destroy
    vagrant box update
    vagrant up

This will remove the older version of the virtual machine, and provision the new version. Note, files saved in the cs-virtualmachine directory are not affected by the "vagrant destroy" command.[1](#fn2)

1.  Older box versions are not deleted by updates. These can be manually removed using the `vagrant box remove --box-version <box-version> <box-name>` command (replace `<box-name>` and `<box-version>` with the name and version of the box you want to remove). Use the `vagrant box list` command to list installed boxes and their version. [↩︎](#ffn2)