echo "Enabling Tap-to-click for i3..."
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "NaturalScrolling" "on"
        Option "TappingButtonMap" "lrm" 
        Option "Tapping" "on"
EndSection

EOF

echo "Updating..."
sudo apt-get update

echo "Installing general packages..."
sudo apt install -y i3 git jq build-essential neovim curl bash-completion pigz p7zip-full net-tools flatpak zsh tmux rofi chromium-browser mpv vlc node-js bat exa libdbus-1-dev pkg-config libssl-dev feh exiftool imagemagick gnome-tweaks xchm fonts-font-awesome gnome-screensaver

echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Downloading zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "Add zsh-completions dirhistory yourself in ~/.zshrc.\nYou don't need to download those"

echo "Installing procs..."
cargo install procs

echo "Installing rustup"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Setting flatpak remote..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "installing i3-gnome..."
git clone https://github.com/i3-gnome/i3-gnome.git ~/Downloads/i3-gnome
cd ~/Downloads/i3-gnome
sudo make install
cd ~

echo "installing i3status-rust..."
git clone https://github.com/greshake/i3status-rust ~/Downloads/i3status-rust
cd ~/Downloads/i3status-rust
cargo install --path .
./install.sh
cd ~

echo "Installing flathub Zoom..."
flatpak install flathub us.zoom.Zoom

echo "Installing flathub VSCode..."
flatpak install flathub com.visualstudio.code

echo "Installing OBS..."
flatpak install flathub com.obsproject.Studio

echo "Install these yourself\nDocker\nOnlyOffice\nMiniconda"
