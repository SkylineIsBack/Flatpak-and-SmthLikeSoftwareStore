#!/bin/bash

# By SkylineIsBack

echo "Installing zenity"
sudo apt install zenity
if zenity --question --title "Installer" --text="What do you wanna install ?" --ok-label=Flatpak --cancel-label=SmthLikeSoftwareStore --no-wrap
then
    zenity --info --title "Installing" --text="Installing Flatpak."
    apt install flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    if zenity --question --title "Reboot" --text="To complete setup, you need to restart your system." --ok-label=Reboot --cancel-label=Cancel
    then
        zenity --info --title "Some Info" --text="After reboot re-run this script to install SmthLikeSoftwareStore"
        sudo reboot
    else
        exit 1
    fi
else
    zenity --info --title "Setting up" --text="Setting up some stuff." --no-wrap
    sudo cp -r SmthLikeSoftwareStore /usr/bin/
    sudo chmod +x /usr/bin/SmthLikeSoftwareStore
    cd ~/.local/share/applications/
    echo "[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=SmthLikeSoftwareStore
Comment=Software Store
Exec=SmthLikeSoftwareStore
Icon=softwarecenter
Terminal=false" >> "SmthLikeSoftwareStore.desktop"
    chmod +x SmthLikeSoftwareStore.desktop
    zenity --info --title "Successful" --text="Successfully installed SmthLikeSoftwareStore" --no-wrap
fi
    
