Vagrant.configure(2) do |config|
    config.vm.box = "debian/contrib-stretch64"

    config.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = "4096"
        vb.cpus = 4
        vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
        vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
        vb.customize ["modifyvm", :id, "--paravirtprovider", "kvm"]
        vb.customize ["modifyvm", :id, "--vram", "256"]
    end

    # install virtualbox additions
    config.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get upgrade -y"
    config.vm.provision "shell", inline: "sudo apt-get install -y xserver-xorg-legacy x-window-system virtualbox-guest-dkms virtualbox-guest-utils build-essential module-assistant ca-certificates xterm"
    config.vm.provision "shell", inline: "sudo update-ca-certificates"

    # permit all users to start x
    config.vm.provision "shell", inline: "sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config"
    
    # install dotfiles
    config.vm.provision "shell", inline: "mkdir -p ~/src && cp -r /vagrant ~/src/dotfiles"

    # install software via ansible bootstrap
    config.vm.provision "shell", inline: "cd ~/src/dotfiles && sudo ./bootstrap.sh"

    config.vm.provision "shell", inline: "cd ~/src/dotfiles && sudo ./bin/links"

end
