#!/bin/bash

instalar_pacman() {
    if pacman -Qs $1 > /dev/null; then
        echo "A package $1 is already installed."
    else
        echo "Instaling $1..."
        sudo pacman -S --noconfirm $1
    fi
}

instalar_flatpak() {
    if flatpak list | grep -q "$1"; then
        echo "A package $1 is already installed via Flatpak."
    else
        echo "Installing $1 ..."
        flatpak install -y $1
    fi
}

instalar_com_curl() {
    echo "installing curl $1..."
    curl -L $2 -o /tmp/$1
    sudo bash /tmp/$1
    rm /tmp/$1
}

echo "Installing Apps "

instalar_pacman "vim"
instalar_pacman "nano"
instalar_pacman "flameshot"
instalar_pacman "copyq"

instalar_pacman "git"
instalar_pacman "neofetch"

instalar_flatpak "org.videolan.VLC"
instalar_flatpak "com.spotify.Client"
instalar_flatpak "md.obsidian.Obsidian"
instalar_flatpak "app/com.brave.Browser/x86_64/stable"


instalar_com_curl "google-chrome.sh" "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

echo "Installation is complete."
#install postgresql and config port
echo "Installing Postgresql"

sudo pacman -S postgresql
postgres --version
sudo su - postgres
initdb --locale en_US.UTF-8 -D /var/lib/postgres/data
exit6
sudo systemctl status postgresql
sudo systemctl start postgresql
sudo systemctl status postgresq1
sudo su - postgres
createuser --interactive
exit
sudo systemctl restart postgresql
