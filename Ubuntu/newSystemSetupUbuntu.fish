# Finish fish setup
omf install harleen
omf install expand
cat ../aliases.fish >> ~/.config/fish/aliases.fish
echo "set -U fish_greeting" >> ~/.config/fish/config.fish
echo "source ~/.config/fish/aliases.fish" >> ~/.config/fish/config.fish


# Packages to install
sudo apt -y install flatpak gnome-software-plugin-flatpak vim pavucontrol apt-transport-https sshfs gnome-shell-extension-caffeine

# Packages to remove
sudo apt -y remove snapd

# LANL mount process setup
mkdir ~/LANL
mkdir ~/LANL/SLACServHome
mkdir ~/LANL/SLACServData1
mkdir ~/LANL/SLACServData2
mkdir ~/LANL/SLACServRoot


# Flatpak section
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak -y install com.bitwarden.desktop org.signal.Signal com.slack.Slack PyCharm-Professional
sudo cp ../Signal.desktop /var/lib/flatpak/exports/share/applications/org.signal.Signal.desktop
sudo cp ../Signal.desktop /var/lib/flatpak/app/org.signal.Signal/current/active/export/share/applications/org.signal.Signal.desktop


# Brave section
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt -y install brave-browser

# Atom editor
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt update
sudo apt -y install atom


# VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt -y install code-insiders

# Kite setup - I think I'm going to leave this off for now

# Autostart applications setup
mkdir ~/.config/autostart/
cp ../autostartDesktopFiles/Slack.desktop ~/.config/autostart/
cp ../autostartDesktopFiles/Signal.desktop ~/.config/autostart/
cp ../autostartDesktopFiles/Bitwarden.desktop ~/.config/autostart/


# Conda setup
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.9.2-Linux-x86_64.sh
chmod +x Miniconda3-py39_4.9.2-Linux-x86_64.sh
bash Miniconda3-py39_4.9.2-Linux-x86_64.sh
~/miniconda3/bin/conda init fish


# Gnome settings
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
# Gnome keybindings import - if this doesn't work, there's anther way with dumping dconf settings
# the second method is outlined in my firefox bookmark about gnome keybindings
# if using the second method, remember to install dconf in this script on the first line
perl ../keybindingsGnomeBackupRestore.pl -i ../keys.csv


# Dropbox
sudo apt -y install nautilus-dropbox
