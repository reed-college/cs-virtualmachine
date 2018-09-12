#!/bin/bash
#
# bootstrap.sh
#
# This file is specified in the Vagrantfile and is loaded by Vagrant as the
# primary provisioning script on the first `vagrant up` or subsequent 'up' with
# the '--provision' flag; also when `vagrant provision`, or `vagrant reload --provision`
# are used. You can also bring up your environment and explicitly not run provisioners 
# by specifying '--no-provision'.
set -e
DEBIAN_FRONTEND=noninteractive

# By storing the date now, we can calculate the duration of provisioning at the
# end of this script.
start_seconds="$(date +%s)"

sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade && sudo apt -y autoremove && sudo apt clean

#install git
sudo apt install -y git || echo "Git installation failed"
echo 'Git installed successfully!'

#install gcc-8
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt update
sudo apt -y install gcc-7 || echo "gcc-7 installation failed" 
echo 'GCC 7 installed successfully!'

#install gcc-8
sudo apt -y install gcc-8 || echo "gcc-8 installation failed" 
echo 'GCC 8 installed successfully!'

#Set gcc-8 as default
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

#install valgrind
sudo apt install -y valgrind || echo "valgrind installation failed"
echo 'valgrind installed successfully'

#install flex and bison
sudo apt install -y flex || echo "flex installation failed"
sudo apt install -y bison || echo "bison installation failed"
echo 'flex and bison installed successfully'

#install latest clang version
sudo apt install -y clang || echo "Clang installation failed" 
echo 'Clang-6 installed successfully!'

#install SML/NJ
sudo apt install -y smlnj || echo "SML/NJ installation failed" 
echo 'SML/NJ installation successfully!'

#install r
sudo apt install -y r-base || echo "R installation failed" 
echo 'R installed successfully!'

#install vim-gtk and emacs
sudo apt install -y vim-gtk || echo "Vim-gtk installation failed" 
sudo apt install -y emacs || echo "Emacs installation failed" 
echo 'emacs and vim-gtk successfully installed!'

#install go
sudo apt install -y golang-go || echo "go installation failed"
echo 'go installed successfully'

#install spim
wget -O qtspim_9.1.20_linux64.deb "https://downloads.sourceforge.net/project/spimsimulator/qtspim_9.1.20_linux64.deb?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fspimsimulator%2Ffiles%2Fqtspim_9.1.20_linux64.deb%2Fdownload&ts=1518130564"
sudo dpkg -i qtspim_9.1.20_linux64.deb || echo "qtspim installation failed"
echo 'qtspim installed successfully'

#install logisim
sudo apt install -y logisim || echo "logisim installation failed"
echo 'logisim installed successfully'

#fix bug with logisim and ATK wrapper
sudo sed -i "s/^assistive_technologies=/#&/" /etc/java-11-openjdk/accessibility.properties

#install sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install sublime-text || echo "Sublime-text installation failed"
echo 'sublime-text successfully installed!'

#install chromium
sudo apt install -y chromium-browser || echo "chromium installation failed"
echo 'chromium successfully installed'

#install ubuntu desktop
sudo apt install -y ubuntu-desktop --no-install-recommends || echo "Desktop environment installation failed"
echo 'Ubuntu desktop successfully installed'

#install gnome terminal and set necessary locale
sudo apt install -y gnuplot || echo "Gnuplot installation failed"
echo 'Gnuplot successfully installed'

#install gnome terminal and set necessary locale
sudo apt install -y gnome-terminal || echo "Terminal installation failed"
echo 'Gnome terminal successfully installed'

#install man pages for c libraries
sudo apt install -y manpages-dev manpages-posix-dev || echo "manpage installation failed"
echo 'man pages installed successfully'

sudo update-locale LANG=en_US.UTF-8

sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade && sudo apt -y autoremove && sudo apt clean

end_seconds="$(date +%s)"
echo "-----------------------------"
echo "Provisioning complete in "$(expr $end_seconds - $start_seconds)" seconds"
