# !/bin/bash

sudo pacman -Syu --noconfirm base-devel gnome-keyring

# install aurman
yaourt -S --no-confirm aurman

# restore pacman state from list file
sudo pacman -Sy - < pacman.list 

# restore AUR state from list file
aurman -Sy -< aur.list

sudo systemctl enable docker.service
sudo systemctl enable numLockOnTty.service
sudo usermod -aG docker $USER 


# install video drivers using manjaro's detector
# sudo mhwd -i pci video-nvidia

# updates cache for locate tool (happens on cron eventually)
sudo ionice -c3 updatedb

# setup pip, virtualenv, and i3-related python dependencies
sudo pip install pip -U
sudo pip install virtualenv virtualenvwrapper
source /usr/bin/virtualenvwrapper.sh
mkvirtualenv i3
~/.env/i3/bin/pip install requests i3pystatus psutil
deactivate

# zsh configuration
if [ $SHELL ne '/bin/zsh' ]
then
    chsh -s /bin/zsh  # and logout
fi
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# if gnome, fix numlock state after logging in:
gsettings set org.gnome.settings-daemon.peripherals.keyboard remember-numlock-state true
