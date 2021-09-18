# Get powerline fonts so agnoster works
sudo pacman -S --noconfirm powerline-fonts # if this doesn't work try powerline-fonts-git from the AUR with yay

# Finish fish setup
omf install agnoster
omf install expand
cat ../aliases.fish >> ~/.config/fish/aliases.fish
echo "set -U fish_greeting" >> ~/.config/fish/config.fish
echo "source ~/.config/fish/aliases.fish" >> ~/.config/fish/config.fish


# Packages to install
sudo pacman -S --noconfirm yay flatpak vim pavucontrol sshfs dropbox base-devel
yay -S --noconfirm brave-bin atom-editor-bin visual-studio-code-bin gnome-shell-extension-caffeine-git miniconda3

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


# Kite setup - I think I'm going to leave this off for now


# Autostart applications setup
mkdir ~/.config/autostart/
cp ../autostartDesktopFiles/Slack.desktop ~/.config/autostart/
cp ../autostartDesktopFiles/Signal.desktop ~/.config/autostart/
cp ../autostartDesktopFiles/Bitwarden.desktop ~/.config/autostart/


# Conda setup - for Arch based it will be installed through the AUR above


# Gnome settings
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
# Gnome keybindings import - if this doesn't work, there's anther way with dumping dconf settings
# the second method is outlined in my firefox bookmark about gnome keybindings
# if using the second method, remember to install dconf in this script on the first line
perl ../keybindingsGnomeBackupRestore.pl -i ../keys.csv
