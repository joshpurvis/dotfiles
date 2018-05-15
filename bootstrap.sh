sudo pacman -S --noconfirm base-devel gnome-keyring

yaourt -S --no-confirm aurman

aurman -S --noconfirm i3-gaps git chromium zsh python-pip scrot i3lock compton nitrogen gsimplecal
aurman -S --noconfirm hicolor-icon-theme network-manager network-manager-applet xorg-xrandr feh fzf coreutils 
aurman -S --noconfirm lxappearance lxsession vimb docker urxvt urxvt-perls libmicrohttpd rofi rofi-scripts 
aurman -S --noconfirm freerdp net-tools nodejs numlockx perl-image-exiftool mlocate rclone aurman 
aurman -S --noconfirm ranger-git w3m dmenu2 rxvt-unicode nvm pulseaudio cava pavucontrol gnu-netcat mopidy mopidy-spotify ncmpcpp xclip
aurman -S --noconfirm tmux systemd-numlockontty alsa-tools strace java-environment-common java-runtime-common
aurman -S --noconfirm the_silver_searcher fd clang base-devel boost libevent bitcoin-qt libpqxx transmission-qt
aurman -S --noconfirm ruby ruby-rdoc gem system-config-printer cups manjaro-printer ufw 
aurman -S --noconfirm docker-compose docker-machine bind-tools net-tools nim nimble lib32-fontconfig



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
