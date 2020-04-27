mkdir -p /home/linuxbrew/    
git clone https://github.com/Homebrew/brew /home/linuxbrew/.linuxbrew/Homebrew 
mkdir -p /home/linuxbrew/.linuxbrew/bin
ln -s /home/linuxbrew/.linuxbrew/Homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/ 
/home/linuxbrew/.linuxbrew/bin/brew install gcc
/home/linuxbrew/.linuxbrew/bin/brew install python
/home/linuxbrew/.linuxbrew/bin/brew install aws-vault
/home/linuxbrew/.linuxbrew/bin/brew install terraform
echo export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin" >> ~/.profile