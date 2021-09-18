# Get powerline fonts so agnoster works
sudo dnf -y install powerline powerline-fonts # if this doesn't work then try the patched powerline fonts from git?

# Finish fish setup
omf install agnoster
omf install expand
cat ../aliases.fish >> ~/.config/fish/aliases.fish
echo "set -U fish_greeting" >> ~/.config/fish/config.fish
echo "source ~/.config/fish/aliases.fish" >> ~/.config/fish/config.fish


# Packages to install
sudo dnf -y install wget flatpak vim pavucontrol apt-transport-https sshfs gnome-shell-extension-caffeine

# Packages to remove
sudo dnf -y remove snapd

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
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf -y install brave-browser

# Atom editor
sudo rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey
sudo sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/yum.repos.d/atom.repo'
sudo dnf check-update
sudo dnf -y install atom

# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf -y install code # does code-insiders work?

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
wget https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2020.03.04-1.fedora.x86_64.rpm
dnf -y install nautilus-dropbox-2020.03.04-1.fedora.x86_64.rpm
