VAGRANT_BOX = 'gusztavvargadr/ubuntu-desktop'
VM_NAME = 'new-vm'
VM_USER = 'vagrant'
Vagrant.configure(2) do |config|
  config.vm.box = VAGRANT_BOX
  config.vm.provider "hyperv" do |v|
    v.memory = 2048
  end
  config.vm.network "private_network", type: "dhcp"
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y git
    apt-get install -y build-essential
    apt-get update
    apt-get upgrade -y
    apt-get autoremove -y
    echo "Creating linuxbrew!"
    rm -rf /home/linuxbrew
    mkdir -p /home/linuxbrew/  
    chown vagrant:vagrant /home/linuxbrew
    apt install apt-transport-https ca-certificates curl software-properties-common gnupg -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt update
    apt install docker-ce -y
    usermod -aG docker vagrant

  SHELL
  config.vm.provision "shell", path: "install.sh", privileged: false
  config.vm.provision "file", source: "~/.aws", destination: "$HOME/.aws"
  config.vm.provision "file", source: "~/.gitconfig", destination: "$HOME/.gitconfig"
  config.vm.provision "file", source: "~/.ssh", destination: "$HOME/.ssh"
end