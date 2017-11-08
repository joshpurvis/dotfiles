# installs ubuntu with i3 window manager, and some personal preferences

sudo add-apt-repository ppa:synapse-core/ppa -y
sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y install i3 i3lock imagemagick \
    scrot nitrogen gnome-applets gsimplecal tmux \  # todo, replace these gnome apps with something else
    rxvt-unicode-256color synapse \
    libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
    libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
    libstartup-notification0-dev libxcb-randr0-dev \
    libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
    libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
    autoconf xutils-dev xorg-dev libtool
