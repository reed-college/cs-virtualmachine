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
# By storing the date now, we can calculate the duration of provisioning at the
# end of this script.
start_seconds="$(date +%s)"

sudo apt update && sudo apt -y upgrade && sudo apt -y autoremove

# install Virtualbox guest additions
# sudo apt install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 || echo "Virtualbox guest additions failed to install"

#install git
sudo apt install -y git || echo "Clang installation failed"
echo 'Git installed successfully!'

#install gcc
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt update
sudo apt -y install gcc || echo "git installation failed" 
echo 'GCC 7 installed successfully!'

#install latest clang version
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-add-repository "deb http://apt.llvm.org/zesty/ llvm-toolchain-zesty-5.0 main"
sudo apt update
sudo apt -y install clang-5.0 || echo "Clang installation failed" 
sudo ln -s /usr/lib/llvm-5.0/bin/clang /usr/bin/clang
echo 'Clang-5 installed successfully!'

#install SML/NJ
sudo apt install -y smlnj || echo "SML/NJ installation failed" 
echo 'SML/NJ installation successfully!'

#install r
sudo apt install -y r-base || echo "R installation failed" 
echo 'R installed successfully!'

#install RStudio
sudo apt install -y gdebi-core
wget -q https://s3.amazonaws.com/rstudio-dailybuilds/rstudio-xenial-1.1.392-amd64.deb
sudo gdebi -n rstudio-xenial-1.1.392-amd64.deb || echo "Rstudio installation failed" 
sudo rm -f rstudio-xenial-1.1.392-amd64.deb
echo 'RStudio successfully installed!'

#install vim-gtk and emacs
sudo apt install -y vim-gtk || echo "Vim-gtk installation failed" 
sudo apt install -y emacs || echo "Emacs installation failed" 
echo 'emacs and vim-gtk successfully installed!'

#install tidyverse R package
sudo apt install -y libssl-dev libcurl4-openssl-dev libxml2-dev || echo "tidyverse dependency installation failed"
echo 'dependencies for tidyverse installed successfully!'
sudo R -e "install.packages('tidyverse', repos='https://ftp.osuosl.org/pub/cran/', dep = TRUE)"
echo 'tidyverse successfully installed!'

# install ubuntu desktop
sudo apt install -y ubuntu-desktop || echo "Desktop environment installation failed"

end_seconds="$(date +%s)"
echo "-----------------------------"
echo "Provisioning complete in "$(expr $end_seconds - $start_seconds)" seconds"
