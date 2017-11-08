Vagrant.configure(2) do |config|
    config.vm.box = "debian/contrib-stretch64"

    config.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = "4096"
        vb.cpus = 4
        vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
        vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
        vb.customize ["modifyvm", :id, "--paravirtprovider", "kvm"]
    end

    # install virtualbox additions
    config.vm.provision "shell", inline: "sudo apt-get update"
    config.vm.provision "shell", inline: "sudo apt-get install -y xserver-xorg-legacy virtualbox-guest-dkms virtualbox-guest-utils build-essential module-assistant "

    # permit all users to start x
    config.vm.provision "shell", inline: "sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config"

    # install software via ansible bootstrap
    config.vm.provision "shell", inline: "/vagrant/bootstrap.sh"
end
