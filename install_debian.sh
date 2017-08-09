#!/bin/bash
# For Debian-based systems.

clear
echo "Installing all Google Web Fonts onto your Debian system"
echo "Downloading the fonts..."
mkdir -p ~/Documents/
cd ~/Documents/
curl -L https://github.com/google/fonts/tarball/master -o master.tar.gz
echo "Extracting the fonts..."
mkdir -p goog-fonts/fonts
tar -zxf master.tar.gz -C goog-fonts/fonts
cd goog-fonts
cd fonts
find . -mindepth 2 -type f -print -exec mv {} . \;
rm -R -- */
rm *.txt
rm *.json
rm *.csv
rm *.md
rm *.html
rm *.py
rm AUTHORS
rm CONTRIBUTORS
cd ..
sudo mv fonts/* /usr/local/share/fonts/

echo "Fonts installed, cleaning up files.."
cd ~/Documents/
rm -f master.tar.gz
rm -rf goog-fonts

echo "Updating font cache..."
fc-cache -f

echo "All done! All Google Fonts installed."
