sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# docker for ubuntu 14.04
SOURCES="deb https://apt.dockerproject.org/repo ubuntu-trusty main"
echo $SOURCES | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y
sudo apt-get install docker-engine -y

# add user to docker sudoers
sudo usermod -aG docker $USER

# fix ufw forwarding
sudo sed -i -e 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/g' /etc/default/ufw

sudo ufw reload
