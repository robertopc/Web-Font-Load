#!/bin/bash

# OS detection
osdetect=$(uname)
file_path="unknown"
if [ "$osdetect" == 'Darwin' ]]; then
  file_path="/Library/Fonts/"
elif [[ "$osdetect" == 'Linux' ]]; then
  if [[ -d /usr/local/share/fonts/ ]]; then # Debian/Ubuntu and others.
    file_path="/usr/local/share/fonts/"
  elif [[ -d /usr/share/fonts/ ]]; then # OpenSUSE, Arch and other distros using this directory structure
    mkdir -p /usr/share/fonts/google/
    file_path="/usr/local/share/fonts/google/"
  else # Fallback to installing fonts locally to the user, this is a safe bet, as several distros use this location.
    mkdir -p ~/.fonts
    file_path="~/.fonts/"
  fi
fi

clear
echo "Installing all Google Web Fonts onto your System"
echo "Downloading the fonts..."
curl -L https://github.com/google/fonts/tarball/master -o ~/Documents/master.tar.gz
echo "Extracting the fonts..."
mkdir -p ~/Documents/goog-fonts/fonts
tar -zxf ~/Documents/master.tar.gz -C ~/Documents/goog-fonts/fonts
sudo find goog-fonts/fonts/ -type f -name "*.ttf" -exec cp {} $file_path \;

echo "Fonts installed; Cleaning up files..."
rm -f ~/Documents/master.tar.gz
rm -rf ~/Documents/goog-fonts
echo "All done! All Google Fonts installed."
