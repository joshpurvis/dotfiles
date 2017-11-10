#!/bin/bash

setup_sources() {
	
    # turn off translations
	mkdir -p /etc/apt/apt.conf.d
	echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/99translations

	# docker 
	cat <<-EOF > /etc/apt/sources.list.d/docker.list
	deb https://apt.dockerproject.org/repo debian-stretch main
	EOF
	apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

	# gcloud 
	CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
	export CLOUD_SDK_REPO
	echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

	# azure
	echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" > /etc/apt/sources.list.d/azure-cloud-sdk.list
	apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893

    # chrome
	echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
	curl https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

    # update caches
    sudo apt-get update
}


sudo apt-get install -y \
		adduser \
        apparmor \
        apt-transport-https \
		automake \
		bzip2 \
		ca-certificates \
		coreutils \
		curl \
        default-jdk \
        dirmngr \
		dnsutils \
		file \
		findutils \
		gcc \
		git \
		gnupg \
		gnupg2 \
		gnupg-agent \
        graphviz \
		gzip \
		hostname \
        htop \
        imagemagick \
		indent \
		iptables \
		jq \
		libc6-dev \
		locales \
		lsof \
		make \
		mount \
		net-tools \
        nmap \
        openvpn \
        openssh-server \
        pandoc \
		rxvt-unicode-256color \
        scrot \
        software-properties-common \
		ssh \
		strace \
		sudo \
		tar \
        tmux \
		tree \
		tzdata \
		unzip \
		xclip \
        vim \
		zip \
        zsh \
		--no-install-recommends

setup_sources;

sudo apt-get install -y \
    docker \
    neovim 

