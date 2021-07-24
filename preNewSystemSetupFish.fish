# Fish shell should already be installed at this point
# sudo pacman -S --noconfirm curl # Arch-based
sudo apt -y install curl # Debian-based
chsh -s /usr/bin/fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install > install
fish install