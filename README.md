# CS Vagrant Boxes

The [Computer Science department](http://www.reed.edu/computer-science/) provides [Vagrant](https://www.vagrantup.com) boxes (pre-built VM images and provisioning scripts) that provide a useful development environment for CS courses.

# Requirements

*   A 64-bit processor
*   At least 4GB of RAM
*   At least 10GB of free disk space

# Setup

A number of packages need to be installed, install all that apply to your platform.

Basic setup:

*   Install [VirtualBox](https://www.virtualbox.org) (you will need at least version 6.0 of VirtualBox for the setup to work correctly)
*   Install [Vagrant](https://www.vagrantup.com/downloads.html) (recommendation is to use the download links on the Vagrant site instead of any package manager versions)
*   If you are using Windows install the [Visual C++ 2010 Redistributable Package](http://www.microsoft.com/en-us/download/details.aspx?id=8328) and Git for Windows (https://git-scm.com/download/win)

# Installation of the Virtual Machine

We provide a customized [`Vagrantfile`](https://www.vagrantup.com/docs/vagrantfile/) via a Github repository. This allows us to provide updates as the lab configuration changes. Apart from this the standard Vagrant workflows apply.

On Mac and Linux, open a terminal window and run the following commands. On Windows, open Git Bash and run the commands:

    git clone https://github.com/reed-college/cs-virtualmachine
    cd cs-virtualmachine
    vagrant plugin install vagrant-vbguest
    vagrant up

The install will take 20-45 minutes to complete. Once complete, you can login with the username and password vagrant/vagrant.

You can also edit the [`Vagrantfile`](https://www.vagrantup.com/docs/vagrantfile/) to change the amount of memory and cores used by the virtual machine. The [VirtualBox provider reference](https://www.vagrantup.com/docs/virtualbox/configuration.html) has more details.

# Shared Folder

Any files saved in the cs-virtualmachine directory will be visible inside the virtual machine. On the virtual machine, the files are available in the /vagrant directory.

# Basic Commands

    vagrant suspend
"vagrant suspend" will save the current running state of the machine and stop it. When you are ready to begin working again, just run "vagrant up", and it will be resumed from where you left off. The main benefit of this method is that it is super fast, usually taking only 5 to 10 seconds to stop and start your work. The downside is that the virtual machine still eats up your disk space, and requires even more disk space to store all the state of the virtual machine RAM on disk.

    vagrant halt
"vagrant halt" will gracefully shut down the guest operating system and power down the guest machine. You can use vagrant up when you are ready to boot it again. The benefit of this method is that it will cleanly shut down your machine, preserving the contents of disk, and allowing it to be cleanly started again. The downside is that it'll take some extra time to start from a cold boot, and the guest machine still consumes disk space.

    vagrant up
"vagrant up" starts the machine.

    vagrant destroy
"vagrant destroy" will remove all traces of the guest machine from your system. It'll stop the guest machine, power it down, and remove all of the guest hard disks. Again, when you are ready to work again, just issue a vagrant up. The benefit of this is that no cruft is left on your machine. The disk space and RAM consumed by the guest machine is reclaimed and your host machine is left clean. The downside is that "vagrant up" to get working again will take some extra time since it has to reimport the machine.

    vagrant ssh
SSHs into the virtual machine as the vagrant user. 

    vagrant reload
The equivalent of running a halt followed by an up. This command is necessary to pick up changes made to the Vagrantfile.
 
# Updating

As new tools are needed, the repository and boxes can be updated.

The repository can be updated using standard [Git workflows](https://help.github.com/articles/fetching-a-remote) or by redownloading the zip file. Run the following commands in the `cs-virtualmachine` directory:

    git pull

To completely rebuild the virtual machine, you run the following commands:

    vagrant destroy
    vagrant up
    
Note, the files you saved in the cs-virtualmachine directory are not affected by the "vagrant destroy" command.

# Troubleshooting

## Virtualbox installation fails on Mac.
Virtualbox has to install some kernel extensions to work properly. Mac's Security and Privacy settings block this by default. Go to System Preferences > Security & Privacy and click "Allow" for the Oracle America software.

## On Mac, "git clone" fails with "xcrun: error: invalid active developer path"
Please run the following command to install the necessary command line tools for Mac:
    
    xcode-select --install

## GUI does not load after installation
You may not be on the latest version of VirtualBox's Guest Additions. First, do a "git pull" to make sure you are on the latest version of this repository. Then run the following command:

    vagrant vbguest --do install
    

## Sluggish performance inside the virtual machine
The virtual machine is initially configured with quite low CPU and memory allocation. If you have more powerful hardware, you can get better performance from the virtual machine by increasing its CPU and memory.

The settings can be modified in the Vagrantfile by changing vb.cpus and vb.memory. Starting the vm using vagrant up will overwrite any settings you have made in the Virtualbox UI.

**Note**: I recommend initially setting these values conservatively. Setting the vm memory to half of available memory and cpu count to 1 is a good start. The values can be increased until a performant virtual machine is configured without degrading performance on the host machine.
