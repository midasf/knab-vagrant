# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :
# Box / OS
VAGRANT_BOX = 'gusztavvargadr/ubuntu-desktop'
# Memorable name for your
VM_NAME = 'new-vm'
# VM User — 'vagrant' by default
VM_USER = 'vagrant'
# Host folder to sync
# HOST_PATH = 
# Where to sync to on Guest — 'vagrant' is the default user name
# GUEST_PATH = 
# # VM Port — uncomment this to use NAT instead of DHCP
# VM_PORT = 8080
Vagrant.configure(2) do |config|
  # Vagrant box from Hashicorp
  config.vm.box = VAGRANT_BOX
  
  # Actual machine name
  #config.vm.hostname = VM_NAME
  # Set VM name in Virtualbox
  config.vm.provider "hyperv" do |v|
    v.memory = 2048
  end
  #DHCP — comment this out if planning on using NAT instead
  config.vm.network "private_network", type: "dhcp"
  # # Port forwarding — uncomment this to use NAT instead of DHCP
  # config.vm.network "forwarded_port", guest: 80, host: VM_PORT
  # Sync folder
  # config.vm.synced_folder HOST_PATH, GUEST_PATH
  # Disable default Vagrant folder, use a unique path per project
  # config.vm.synced_folder '.', '/home/'+VM_USER+'', disabled: true
  # Install Git, Node.js 6.x.x, Latest npm
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y git
    # curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    # apt-get install -y nodejs
    apt-get install -y build-essential
    # npm install -g npm
    apt-get update
    apt-get upgrade -y
    apt-get autoremove -y
    echo "Creating linuxbrew!"
    rm -rf /home/linuxbrew
    mkdir -p /home/linuxbrew/  
    chown vagrant:vagrant /home/linuxbrew
    #PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:"/home/linuxbrew/.linuxbrew/opt/python@3.8/bin":$PATH 
    
    # /home/linuxbrew/.linuxbrew/bin/brew install gcc
    # /home/linuxbrew/.linuxbrew/bin/brew install python
    # /home/linuxbrew/.linuxbrew/bin/brew install aws-vault
    # /home/linuxbrew/.linuxbrew/bin/brew install terraform
    #pip3 install awscli
  SHELL
  config.vm.provision "shell", path: "install.sh", privileged: false
  config.vm.provision "file", source: "~/.aws", destination: "$HOME/.aws"
  config.vm.provision "file", source: "~/.gitconfig", destination: "$HOME/.gitconfig"
  config.vm.provision "file", source: "~/.ssh", destination: "$HOME/.ssh"
end